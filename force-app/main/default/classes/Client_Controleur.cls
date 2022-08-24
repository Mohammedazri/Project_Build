public class Client_Controleur {
public List<Client__c> Clients {get; set;}

public Client_Controleur(){
	Clients =  [SELECT Id, Nom__c,Prenom__c, Numero_d_appartement_Achete__c,Date_d_achat__c,Batiment__c,Somme_pay_e__c FROM Client__c];
}
}