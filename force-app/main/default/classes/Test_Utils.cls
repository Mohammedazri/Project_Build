@isTest
public class Test_Utils {

//1: Method to Test Trigger of APO1_Ouvrier
//+++++++++++++++++++++++++++++++++++++++++
public static List<Contact> createContacts() {

	List<Contact> Contacts = new List<Contact>();
    //Contact 1 Date==Null
	Contact contactWithoutDate = new Contact(
		FirstName='Test', LastName=' Sam'
		                            //Date_de_fin_du_Contrat__c=null
		);
	Contacts.add(contactWithoutDate);

	//Contact 2 Date!=Null(Case of Update)
	Contact contactWithDate = new Contact(
		FirstName='Testw', LastName=' Samw', OwnerId='0057Q000006iuiPQAQ',
		Date_de_fin_du_Contrat__c=Date.newInstance(2022, 12, 31)
		);

	//Contact 3 Date!=Null(Case of Update)
	Contact contactWithDate2 = new Contact(
		FirstName='Test3', LastName=' Sam3',
		Date_de_fin_du_Contrat__c=Date.newInstance(2022, 1, 1)
		);

	Contacts.add(contactWithDate);
	return contacts;
}


//2:Methods of Batiment Class Tests
//++++++++++++++++++++++++++++++++

// We need to assign the Ingenieur to the correct recordtype after it has been loaded
public static List<Account> loadIngenieurs() {
	List<Account> initialAccount = new List<Account>();
	String muRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Personnel').getRecordTypeId(); 
	Account myAccount = new Account(recordTypeId=muRecordTypeId, Name='Test2');
	insert myAccount;
    initialAccount.add(myAccount);
	return initialAccount;
}

// We lood Batiment__c
public static List<Batiment__c> loadsBats() {
	List<Batiment__c> initialBat = new List<Batiment__c>();
	Batiment__c myBat = new Batiment__c(Name='Batiment1', Village__c='a007Q000009fbqCQAQ', Account__c=null);
	insert myBat;
    initialBat.add(myBat);
	return initialBat;
}

public static List<User> loadUsers() {
	List<User> initialUser = new List<User>();
	Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator']; 
	User myUser = new User(alias = 'standt', Email='group2.dev450@gmail.com', 
	EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
	LocaleSidKey='en_US', ProfileId = p.Id,
	TimeZoneSidKey='America/Los_Angeles', UserName='grp@testorg.com');
	insert myUser;
    initialUser.add(myUser);
	return initialUser;
}

public static List<Contact> loadContacts() {
	List<Contact> initialContact = new List<Contact>();
	Contact MyContact = new Contact(FirstName='Testw', LastName=' Samw', OwnerId='0057Q000006iuiPQAQ',
	Date_de_fin_du_Contrat__c=Date.newInstance(2022, 12, 10));
	insert MyContact;
	MyContact.Date_de_fin_du_Contrat__c = Date.newInstance(2022, 11, 11);
	update MyContact;
	initialContact.add(MyContact);
	return initialContact;
}

public static List<Client__c> loadClients(){
	List<Client__c> initialClients = new List<Client__c>();
	Client__c MyClient = new Client__c(Nom__c='Ali',Prenom__c='Sam', Numero_d_appartement_Achete__c=37,
	Date_d_achat__c=Date.newInstance(2022, 11, 12),Batiment__c='a017Q00000zS3baQAC',Somme_pay_e__c=5678899);
	insert MyClient;
	return initialClients;
}
//We generate a list of Batimment__c Without Ingenieur
public static List<Batiment__c> createBatimentsWithoutIngenieur() {
	List<Batiment__c> Batiments = new List<Batiment__c>();
	Batiment__c BatimentwithountIngenieur = new Batiment__c(Name='Batiment1', Village__c='a007Q000009fbqCQAQ', Account__c=null);
	Batiments.add(BatimentwithountIngenieur);
	return batiments;
}


//We generate a list of Batimment__c With Ingenieur 
public static List<Batiment__c> createBatimentsWithIngenieur() {

	List<Batiment__c> Batiments = new List<Batiment__c>();
	Batiment__c createBatimentsWithIngenieur = new Batiment__c(Name='Batiment2', Village__c='a007Q000009fbqCQAQ', Account__c='0017Q00000RisFiQAJ');
	Batiments.add(createBatimentsWithIngenieur);
	return batiments;
}


}