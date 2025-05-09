import { LightningElement } from 'lwc';

export default class DynamicForm extends LightningElement {
    selectedRole = '';
    schoolName = '';
    grade = '';
    companyName = '';
    designation = '';

    get roleOptions() {
        return [
            { label: 'Student', value: 'Student' },
            { label: 'Employee', value: 'Employee' }
        ];
    }

    get isStudent() {
        return this.selectedRole === 'Student';
    }

    get isEmployee() {
        return this.selectedRole === 'Employee';
    }

    handleRoleChange(event) {
        this.selectedRole = event.detail.value;
    }
}
