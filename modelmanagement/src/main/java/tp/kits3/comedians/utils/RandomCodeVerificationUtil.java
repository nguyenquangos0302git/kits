package tp.kits3.comedians.utils;

public class RandomCodeVerificationUtil {

	public static int randomCodeVerification () {
		return (int) Math.floor(((Math.random() * 899999) + 100000));
	}
	
}
