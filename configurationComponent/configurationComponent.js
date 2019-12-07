import { LightningElement, wire, track } from 'lwc';
import getAllSObjects from '@salesforce/apex/ConfigurationController.getAllSObjects';
import getAllLookupFields from '@salesforce/apex/ConfigurationController.getAllLookupFields'

export default class ConfigurationComponent extends LightningElement {
    @wire(getAllSObjects)
    sObjectsList;
    @track selectedSObject;
    @track selectedAccountField;
    @track selectedContactField;
    
    @wire(getAllLookupFields, { objectName: '$selectedSObject' })
    fields;

    setSharedContactObject(event) {
        this.selectedSObject = event.target.value; 
     }
     setContactField(event)
     {
        this.selectedContactField = event.target.value; 
     }
     setAccountField(event)
     {
        this.selectedAccountField = event.target.value; 
     }
}