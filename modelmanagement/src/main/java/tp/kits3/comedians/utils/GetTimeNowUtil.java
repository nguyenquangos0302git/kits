package tp.kits3.comedians.utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class GetTimeNowUtil {

	public static Date getTimeNow() {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date date = formatter.parse(formatter.format(calendar.getTime()));
			return date;
		} catch (ParseException e) {
			System.out.println(e);
			return null;
		}
	}
	
}
