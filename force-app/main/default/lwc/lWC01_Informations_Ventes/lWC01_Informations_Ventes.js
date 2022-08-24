import { LightningElement, wire, api, track } from 'lwc';
import getMyClients from '@salesforce/apex/LWC01_Informations_Ventes_Controlleur.getClients';
import Nom from '@salesforce/schema/Client__c.Nom__c';
import Prenom from '@salesforce/schema/Client__c.Prenom__c';
import Numero_Appart from '@salesforce/schema/Client__c.Numero_d_appartement_Achete__c';
import Date  from '@salesforce/schema/Client__c.Date_d_achat__c';
import Batiment from '@salesforce/schema/Client__c.Batiment__c';
import Somme_paye from '@salesforce/schema/Client__c.Somme_pay_e__c';

const COLS = [
    {
        label: 'Nom',
        fieldName: Nom.Nom__c,
        editable: false
    },
    {
        label: 'Prénom',
        fieldName: Prenom.Prenom__c,
        editable: false
    },

   
    {
        label: 'Numéro d\'appartement',
        fieldName: Numero_Appart.Numero_d_appartement_Achete__c,
        editable: false
    },
    {
        label: 'Date',
        fieldName: Date.Date_d_achat__c,
        editable: false
    },
    {
        label: 'Batiment',
        fieldName: Batiment.Batiment__c,
        editable: false
    },
    {
        label: 'Somme payée',
        fieldName: Somme_paye.Somme_pay_e__c,             
        editable: false
    }
];

export default class LWC01_Informations_Ventes extends LightningElement {
    
    @track clients;
    error;
    
    columns = COLS;
    draftValues = [];

    @wire(getMyClients) 
        ListClients({ error, data }) {
            if (data) {
                this.clients = data;
            } else if (error) {
                this.error = error;
                this.clients = undefined;
            }
        
    

}
}