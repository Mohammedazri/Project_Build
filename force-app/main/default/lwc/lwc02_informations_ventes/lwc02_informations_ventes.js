//Import des données à utiliser
import { LightningElement, wire, track } from 'lwc';
import getClients from '@salesforce/apex/ClientControlleur.getClients';
import Nom from '@salesforce/schema/Client__c.Nom__c';
import Batiment from '@salesforce/schema/Client__c.Batiment__c';

//COnstruction des colonnes du tableau
const columns = [
    
    {label: 'Nom', fieldName: 'recordLink1',type:'url', 
    typeAttributes: {label: { fieldName: "Nom__c" }, tooltip:"Name", target: "_blank" }},
        
    {label: 'Prénom', fieldName: 'Prenom__c', type:'text'},

    {label: 'Numero d\'Appartement', fieldName: 'Numero_d_appartement_Achete__c', type:'Number'},

    {label: 'Date d\'Achat', fieldName: 'Date_d_achat__c', type:'Date'},

    {label: 'Batiment', fieldName: 'recordLink2',  type:'url', 
    typeAttributes: {label: { fieldName: 'Batiment' }, tooltip:"Nom Batiment", target: "_blank" }},

    {label: 'Somme payeé', fieldName: 'Somme_pay_e__c', type:'Currency'}
];

//Les données à retourner pour l'affichage dans le tableau
export default class Lwc02_informations_ventes extends LightningElement{
    
error;
//Création de la liste de clients à afficher(Dynamique) avec la gestion des erreurs
@track ClientList = []; 
      
cols = columns; 
@wire(getClients) getClientList({error,data}){
    var sum=0;
    console.log('Id Data'+JSON.stringify(data));
    if (data)
    {
        var tempClientList = []; 
        for(var i=0;i<data.length;i++){
            let tempRecord = Object.assign({}, data[i]); //cloning object  
            tempRecord.recordLink1 = "/" + tempRecord.Id;
            console.log('Id Client:'+tempRecord.recordLink1);
            tempRecord.recordLink2 = "/" + tempRecord.Batiment__r.Id; 
            tempRecord.Batiment = tempRecord.Batiment__r.Name;
            console.log('Id Batiment:'+tempRecord.recordLink2);
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