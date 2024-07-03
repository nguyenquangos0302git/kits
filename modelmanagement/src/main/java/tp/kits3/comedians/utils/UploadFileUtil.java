package tp.kits3.comedians.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.lang.StringUtils;

public class UploadFileUtil {
		
	public final static String root = "C:\\Users\\ThePlayer\\Desktop\\ModelManagement\\kits-03-comedians\\src\\main\\webapp\\resources\\images\\avatar";
	
	public final static String root_Quang = "C:\\Users\\QuangNguyen\\Desktop\\comedians_project\\kits-03-comedians\\src\\main\\webapp\\resources\\images\\avatar";

	public static void writeOrUpdate(byte[] bytes, String path) {
		File file = new File(StringUtils.substringBeforeLast(root + path, "/"));
		if (!file.exists()) {
			file.mkdir();
		}
		
		FileOutputStream fileOutputStream = null;
		try {
			fileOutputStream = new FileOutputStream(new File(root + path));
			fileOutputStream.write(bytes);
		} catch (Exception e) {
			System.out.println(e);
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				fileOutputStream.close();
			} catch (IOException e) {
				System.out.println(e);
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}
