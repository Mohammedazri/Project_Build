public with sharing class AP01_Batiment {
public static void attacherIngenieur(List <Batiment__c> bat)  {
	System.debug('List'+bat);
	//Construire une liste de batiments sans ingénieurs
	List<Batiment__c> BatToUpdate = new List<Batiment__c>();
	//Construire une liste d'Ingénieurs
	List<Account>  IngenieurToCreate = new List<Account>();
	//Construire une Map des Ingénieurs à Update
	Map<Id,Account> batToIngenieurMap = new Map<Id,Account>();

	//Pour préciser l'accés RecordType de type : Personnel dans Account
	Id acc1r = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Personnel').getRecordTypeId();

	//Parcourir la liste des batiments pour faire l'insertion de Account if Null
	for(Batiment__c bati:bat)
	{
		if(bati.Account__c == null)
		{
			Account ing = new Account(Name = 'Ingénieur: '+bati.Name );
			ing.RecordTypeId= acc1r;
			IngenieurToCreate.add(ing);
			System.debug('Voici votre message:'+ing);
			BatToUpdate.add(new Batiment__c (Id=bati.Id));
			batToIngenieurMap.put(bati.Id, ing);
		}

        // Bulck
		if (IngenieurToCreate.size()>0) {
			Try {
				Insert IngenieurToCreate;
				System.debug('Ingenieur bien affecté');
			}
			Catch (System.DmlException e){
				BatimentException.MyDmlException(e);
			}
			catch (Exception exp) {
				System.debug('Une erreur s\'est produite lors de l\'insertion : ' + exp.getMessage());
			}
			for(Batiment__c bato:BatToUpdate) {
				Bato.Account__c = batToIngenieurMap.get(bato.Id).Id;
			}
			Try {
				Update BatToUpdate;
				System.debug('Ingenieur bien affecté');
			}
			Catch (System.DmlException e){
				BatimentException.MyDmlException(e);
			}
			catch (Exception exp) {
				System.debug('Une erreur s\'est produite lors de l\'update : ' + exp.getMessage());
			}
		}

	}

}
}