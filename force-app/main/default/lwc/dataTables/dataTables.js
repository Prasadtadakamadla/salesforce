import { LightningElement, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
import updateAccounts from '@salesforce/apex/AccountController.updateAccounts';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const actions = [
    { label: 'Edit', name: 'edit' },
    { label: 'Delete', name: 'delete' }
];

export default class DataTables extends LightningElement {
    @track data = [];
    @track draftValues = [];

    columns = [
        { label: 'ID', fieldName: 'Id' },
        { label: 'Account Name', fieldName: 'Name', type: 'text', editable: true },
        { label: 'Industry', fieldName: 'Industry', type: 'text', editable: true },
        {
            type: 'action',
            typeAttributes: { rowActions: actions }
        }
    ];

    @wire(getAccounts)
    wiredAccounts({ data, error }) {
        if (data) {
            this.data = data;
        } else if (error) {
            console.error('Error fetching accounts:', error);
        }
    }

    async handleSave(event) {
        const updatedFields = event.detail.draftValues;

        try {
            await updateAccounts({ accList: updatedFields });

            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Records updated successfully',
                    variant: 'success'
                })
            );

            // Clear draft values
            this.draftValues = [];

            // Refresh the wire to get the latest data
            return refreshApex(this.data);

        } catch (error) {
            console.error('Error updating records:', error);

            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error updating records',
                    message: error.body.message,
                    variant: 'error'
                })
            );
        }
    }
}
