import { LightningElement, api, wire } from 'lwc';
import { getRecord, updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import LEAD_OBJECT from '@salesforce/schema/Lead';
import STATUS_FIELD from '@salesforce/schema/Lead.Status';
import ID_FIELD from '@salesforce/schema/Lead.Id';
import NAME_FIELD from '@salesforce/schema/Lead.Name';
import COMPANY_FIELD from '@salesforce/schema/Lead.Company';

export default class LeadQualifier extends LightningElement {
    @api recordId;

    leadName;
    company;
    status;

    budgetConfirmed = false;
    decisionMaker = false;
    timelineSet = false;

    // direct way
    // getRecord({ recordId: this.recordId, fields: [NAME_FIELD] })
    // .then(result => { /* handle success */ })
    // .catch(error => { /* handle error */ });

    @wire(getRecord, { recordId: '$recordId', fields: [NAME_FIELD, COMPANY_FIELD, STATUS_FIELD] })
    loadLead({ error, data }) {
        if (data) {
            this.leadName = data.fields.Name.value;
            this.company = data.fields.Company.value;
            this.status = data.fields.Status.value;
        } else if (error) {
            this.dispatchEvent(new ShowToastEvent({ title: 'Error loading Lead', message: error.body.message, variant: 'error' }));
        }
    }

    handleBudget(event) {
        this.budgetConfirmed = event.target.checked;
    }

    handleDecisionMaker(event) {
        this.decisionMaker = event.target.checked;
    }

    handleTimeline(event) {
        this.timelineSet = event.target.checked;
    }

    handleQualify() {
        if (this.budgetConfirmed && this.decisionMaker && this.timelineSet) {
            const fields = {//Id: this.recordId,
            //     Status: 'Qualified'
            };
            fields[ID_FIELD.fieldApiName] = this.recordId;
            fields[STATUS_FIELD.fieldApiName] = 'Qualified';

            const recordInput = { fields };

            updateRecord(recordInput)
                .then(() => {
                    this.dispatchEvent(new ShowToastEvent({ title: 'Success', message: 'Lead qualified!', variant: 'success' }));
                })
                .catch(error => {
                    this.dispatchEvent(new ShowToastEvent({ title: 'Error', message: error.body.message, variant: 'error' }));
                });
        } else {
            this.dispatchEvent(new ShowToastEvent({ title: 'Missing Info', message: 'Please complete all criteria.', variant: 'warning' }));
        }
    }
}
