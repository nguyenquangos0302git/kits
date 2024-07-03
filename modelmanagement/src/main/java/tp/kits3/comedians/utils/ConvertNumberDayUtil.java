package tp.kits3.comedians.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import tp.kits3.comedians.constant.SystemConstant;

public class ConvertNumberDayUtil {
	
	static public int covertDay(Timestamp date) {		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String[] birthday = formatter.format(date).toString().split("-");
		return SystemConstant.NUMBERS_OF_WORKDAYS - Integer.parseInt(birthday[2]);
	}

}
