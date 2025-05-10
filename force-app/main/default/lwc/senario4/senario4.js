import { LightningElement, api, wire, track } from 'lwc';
import { getRecord, updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import ID_FIELD from '@salesforce/schema/Opportunity.Id';
import OWNERID_FIELD from '@salesforce/schema/Opportunity.OwnerId';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';

const FIELDS = [AMOUNT_FIELD, OWNERID_FIELD];

export default class AssignRepToOpportunity extends LightningElement {
    @api recordId;
    @track amount;
    @track ownerId;
    @track selectedRep = '';
    showDropdown = false;

    // Dummy top sales reps - this can be dynamically loaded too
    topReps = [
        { label: 'Ravi Kumar', value: '005XXXXXXXXXXXXAAA' },
        { label: 'Sneha Verma', value: '005XXXXXXXXXXXXAAB' },
        { label: 'Amit Shah', value: '005XXXXXXXXXXXXAAC' }
    ];

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    wiredOpportunity({ data, error }) {
        if (data) {
            this.amount = data.fields.Amount.value;
            this.ownerId = data.fields.OwnerId.value;
            this.showDropdown = this.amount > 1000000;
        } else if (error) {
            this.showToast('Error', 'Failed to load opportunity', 'error');
        }
    }

    handleChange(event) {
        this.selectedRep = event.detail.value;
    }

    handleAssign() {
        const fields = {};
        fields[ID_FIELD.fieldApiName] = this.recordId;
        fields[OWNERID_FIELD.fieldApiName] = this.selectedRep;

        updateRecord({ fields })
            .then(() => {
                this.showToast('Success', 'Sales rep assigned successfully', 'success');
            })
            .catch(error => {
                this.showToast('Error', error.body.message, 'error');
            });
    }

    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
    }
}