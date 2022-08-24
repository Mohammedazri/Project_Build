public with sharing class ClientControlleur{
    public ClientControlleur(){
        
    }
    @AuraEnabled(cacheable=true)
        public static List<Client__c> getClients(){
        return [SELECT Nom__c,Prenom__c, Numero_d_appartement_Achete__c,Date_d_achat__c,
        Somme_pay_e__c 
        FROM Client__c Limit 10
        ];
            
      }
}