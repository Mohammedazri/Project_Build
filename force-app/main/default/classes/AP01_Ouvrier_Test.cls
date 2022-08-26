@isTest
public class AP01_Ouvrier_Test {
//Préparation des données pour le test
@TestSetup
static void setupData(){
	List<Contact> testContacts = Test_Utils.loadContacts();
	List<User> testUsers = Test_Utils.loadUsers();
}

//Test When create a new Contact with Date_de_fin_du_Contrat__c (Insert)
@isTest
static void NewContactsWithDate(){
	Contact contToinsert = [Select Name,Date_de_fin_du_Contrat__c from Contact Where OwnerId='0057Q000006iuiPQAQ' Limit 1];
	System.assertNotEquals(Null, contToinsert.Date_de_fin_du_Contrat__c, 'La date de fin de contrat n\'a pas éte remplie');
}

//Test When Date_de_fin_du_Contrat__c  is changed for a new value(Update)
@isTest
static void UpdateContactWithDate(){
	Contact contToUpdate = [Select Name,Date_de_fin_du_Contrat__c from Contact Where OwnerId='0057Q000006iuiPQAQ' Limit 1];
	System.assertNotEquals(Null, contToUpdate.Date_de_fin_du_Contrat__c, 'La date de fin de contrat n\'a pas éte remplie');
	contToUpdate.Date_de_fin_du_Contrat__c = Date.newInstance(2022, 10, 18);
	System.assertNotEquals(Date.newInstance(2022, 12, 10), contToUpdate.Date_de_fin_du_Contrat__c, 'La date de fin de contrat n\'a pas éte changé');

}
}