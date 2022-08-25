public with sharing class AP01_Ouvrier {
public static void envoyerEmail(List<contact> newOuvrierList,Map<ID, contact> oldOuvrierMap) {

	// Case 1: List Of contacts without End Date Contract
	List<Contact> ouvrierCreatwithOutDate =new List<Contact>();
	// Case 2: List Of contacts With End Date Contract
	List<Contact> ouvrierToUpdate=new List<Contact>();
	// Case 3: List of Users to reach the owner of each contact
	List<String> IdUser=new List<String>();
    
	//Query list of Users to reach the owner of each contact
	for(Contact c:newOuvrierList){
    IdUser.add(c.OwnerId);
	}
	User prop = [Select Id, Email, Name from User where Id In:IdUser];
    
	//Check of Date_de_fin_du_Contrat__c  if not null or is Update send an Email 
	for(Contact cont:newOuvrierList) {
		if(cont.Date_de_fin_du_Contrat__c!=null) {

			if (oldOuvrierMap != null)
			{
				
				if (oldOuvrierMap.get(cont.Id).Date_de_fin_du_Contrat__c != cont.Date_de_fin_du_Contrat__c) {
					ouvrierToUpdate.add(cont);
					prepareEmail(prop.Email,prop.Name,cont);
			}

			}else{
				ouvrierCreatwithOutDate.add(cont);
				prepareEmail(prop.Email,prop.Name,cont);

			}
		}
	}

}
// The method that preparing the sent of message, the method is called above
public static void prepareEmail(String a,String b,Contact contactNew){
	List<Messaging.SingleEmailMessage> emailObjs = new List<Messaging.SingleEmailMessage>();
	Messaging.SingleEmailMessage emailObj= new Messaging.SingleEmailMessage();
	List<String> emailAddress = new List<String>();
	emailAddress.add(a);
	String Content = 'Bonjour '+b+ '.<br/><br/>'+
	                 'La date de fin de contrat de l\'ouvrier  : <b>'+ contactNew.LastName + '</b> est devenue le : '+contactNew.Date_de_fin_du_Contrat__c +'<br/><br/>'+
	                 'Bien Cordialement.<br/><br/>'+
	                 'Equipe Administration.';
	emailObj.setToAddresses(emailAddress);
	emailObj.setSubject('Nouvelle date de fin de Contrat');
	emailObj.setHtmlBody(Content);
	emailObjs.add(emailObj);
	Messaging.sendEmail(emailObjs);
}
}