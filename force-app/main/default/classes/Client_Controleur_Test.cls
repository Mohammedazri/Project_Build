@isTest
public with sharing class Client_Controleur_Test {
@TestSetup
static void setupData(){
	List<Client__c> testClients = Test_Utils.loadClients();
}

@isTest
static void NewClient(){
	Client__c ClientToinsert = [SELECT Id, Nom__c,Prenom__c, Numero_d_appartement_Achete__c,Date_d_achat__c,Batiment__c,Somme_pay_e__c From Client__c Limit 1];
	System.assertNotEquals(Null, ClientToinsert.Batiment__c, 'Le client n\'a pas été crée');
}

}