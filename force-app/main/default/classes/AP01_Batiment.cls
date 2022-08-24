public with sharing class AP01_Batiment {
public static void attacherIngenieur(List <Batiment__c> bat)  {
	System.debug('List'+bat);
	//Construire une liste de batiments sans ingénieurs
	List<Batiment__c> BatToUpdate = new List<Batiment__c>();
	List<Account>  IngenieurToCreate = new List<Account>();
	Map<Id,Account> batToIngenieurMap = new Map<Id,Account>();

	Id acc1r = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Personnel').getRecordTypeId();


	// List<Batiment__c> bats = [Select nom__c from Batiment__c where Account__c=null];
	for(Batiment__c bati:bat )
	{
		if(bati.Account__c == null)
		{

			Account ing = new Account(Name = 'Ingénieur: '+bati.Name );
			//try{
				ing.RecordTypeId= acc1r;
				IngenieurToCreate.add(ing);
				System.debug('Voici votre message:'+ing);
				BatToUpdate.add(new Batiment__c (Id=bati.Id));
				batToIngenieurMap.put(bati.Id, ing);
				//Database.SaveResult SR = Database.update(bati, false);
			//}
			// catch (Exception exp) {
			// 	throw new BatimentException(exp);

			// }

		}


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