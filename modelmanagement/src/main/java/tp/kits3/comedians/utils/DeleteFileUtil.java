package tp.kits3.comedians.utils;

import java.io.File;

public class DeleteFileUtil {

	public final static String root = "C:\\Users\\ThePlayer\\Desktop\\ModelManagement\\kits-03-comedians\\src\\main\\webapp\\resources\\images\\avatar";
	
	public final static String root_Quang = "C:\\Users\\QuangNguyen\\Desktop\\comedians_project\\kits-03-comedians\\src\\main\\webapp\\resources\\images\\avatar";
	
	public static void deleteFileUtil(String who, String path) {
		int index = path.lastIndexOf("/");
		String fileImageName = path.substring(index + 1);
		File file = new File(root_Quang + "\\" + who + "\\" + fileImageName);
		
		try {
			if (file.delete()) {
				System.out.println("Delete ok");
			} else {
				System.out.println("Can't not file");
			}
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
	}
	
}
