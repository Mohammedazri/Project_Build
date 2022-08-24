public with sharing class LWC01_Informations_Ventes_Controlleur {
    @AuraEnabled
    public static List<Client__c> getClients(){
        return [SELECT Nom__c,Prenom__c, Numero_d_appartement_Achete__c,Date_d_achat__c,
        Somme_pay_e__c 
        FROM Client__c
        ];
            
 }
}