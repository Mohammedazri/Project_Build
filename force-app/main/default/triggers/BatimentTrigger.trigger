trigger BatimentTrigger on Batiment__c (After insert) {
    if(Trigger.isInsert){    
        AP01_Batiment.attacherIngenieur(Trigger.New);
    }
}