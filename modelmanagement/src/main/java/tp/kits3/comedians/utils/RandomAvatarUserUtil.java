package tp.kits3.comedians.utils;

import java.util.Random;

public class RandomAvatarUserUtil {

	private static final int MAX_NUMBER_IMAGE = 6;
	
	public static String randomAvatarUser() {
		Random generator = new Random();
		int random = generator.nextInt(MAX_NUMBER_IMAGE) + 1;
		return "resources/images/system/avatar/system_avatar_" + random + ".jpg";
	}
	
}
