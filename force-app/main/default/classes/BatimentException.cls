public class  BatimentException extends Exception {
public void BatimentException(Exception exp) {
	System.debug('Une exeption s\'est produite: '+exp.getMessage()+ ' Dans la ligne suivante: ' + exp.getStackTraceString());
}

public static void MyDmlException(System.DmlException e){
	//update our err flag
	boolean err = false;
	err = true;
	System.debug('Erreur au moment de l\'insertion en bulck:');
	for (Integer k = 0; k < e.getNumDml(); k++) {
		// Process exception here
		System.debug(e.getDmlMessage(k));
	}
}
}