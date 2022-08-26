@isTest
public class AP01_Batiment_Test {
//Préparation des données pour le test
@TestSetup
static void setupData(){
List<Account> TestAccount = Test_Utils.loadIngenieurs();
List<Batiment__c> testBatiments = Test_Utils.loadsBats();

}
//Assertion pour vérifier les résultats
@isTest
static void BatimentWithoutIngenieur() {
    Batiment__c bati2 = [SELECT Name, village__c, Account__c FROM Batiment__c where Name='Batiment1' Limit 1];
    system.assertNotEquals(null, bati2.Account__c, 'Le champs Ingénieur n\'est pas rempli');
	
	}
    // test pout le gitHub
    
}