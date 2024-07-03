/**
 * @author dung
 */
package tp.kits3.comedians.utils;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.stereotype.Component;

@Component
public class AgePerson {
	
	static public int ages(Date date) {
		Calendar now = Calendar.getInstance();
		int yearNow = now.get(Calendar.YEAR);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String[] birthday = formatter.format(date).toString().split("-");
		return yearNow - Integer.parseInt(birthday[0]);
	}
	
	static public int ages(Timestamp date) {
		Calendar now = Calendar.getInstance();
		int yearNow = now.get(Calendar.YEAR);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String[] birthday = formatter.format(date).toString().split("-");
		return yearNow - Integer.parseInt(birthday[0]);
	}
}
