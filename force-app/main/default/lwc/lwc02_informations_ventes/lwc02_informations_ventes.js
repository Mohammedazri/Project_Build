import { LightningElement, wire, track } from 'lwc';
import getClients from '@salesforce/apex/ClientControlleur.getClients';
import Nom from '@salesforce/schema/Client__c.Nom__c'

const columns = [
     
    {label: 'Nom', fieldName: 'recordLink',type:'url', 
    typeAttributes: {label: { fieldName: "Nom__c" }, tooltip:"Name", target: "_blank" }},
    {label: 'Prénom', fieldName: 'Prenom__c', type:'text'},
    {label: 'Numero d\'Appartement', fieldName: 'Numero_d_appartement_Achete__c', type:'Number'},
    {label: 'Date d\'Achat', fieldName: 'Date_d_achat__c', type:'Date'},
    {label: 'Somme payeé', fieldName: 'Somme_pay_e__c', type:'Currency'}
];

export default class Lwc02_informations_ventes extends LightningElement{
    
error;
@track ClientList = []; 
    
   
cols = columns; 
@wire(getClients) getClientList({error,data}){
    var sum=0;
    if (data)
    {
        var tempClientList = []; 
        for(var i=0;i<data.length;i++){
            let tempRecord = Object.assign({}, data[i]); //cloning object  
            tempRecord.recordLink = "/" + tempRecord.Id;  
            tempClientList.push(tempRecord); 
            sum+=data[i].Somme_pay_e__c;    
        }
        this.ClientList = tempClientList;  
        this.error = undefined; 
        this.sum=sum;
    }
    else{
        if(error){
            this.error = error;  
            this.ClientList = undefined;
        }
    }
}
}