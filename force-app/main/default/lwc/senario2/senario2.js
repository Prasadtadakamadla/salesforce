import { LightningElement } from 'lwc';

export default class Senario2 extends LightningElement {
    searchKey = '';

    handleContactNameChange(event){
        this.contactName = event.target.value;
    }
} 