/**
 * @author giang
 */

package tp.kits3.comedians.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {

//	public static void addCookie(HttpServletResponse resp, AccountUserRoleDTO account) {
//		Cookie ckUsername = new Cookie("username", account.getUsername());
//		ckUsername.setMaxAge(3600);
//		resp.addCookie(ckUsername);
//		Cookie ckPassword = new Cookie("password", account.getPassword());
//		ckPassword.setMaxAge(3600);
//		resp.addCookie(ckPassword);
//	}

	public static void removeCookie(HttpServletRequest res, HttpServletResponse resp) {
		for (Cookie cookie : res.getCookies()) {
			if (cookie.getName().equalsIgnoreCase("authorization")) {
				cookie.setMaxAge(0);
				resp.addCookie(cookie);
			}
		}
	}

//	public static AccountUserRoleDTO checkCookie(HttpServletRequest res) {
//		Cookie[] cookies = res.getCookies();
//		AccountUserRoleDTO account = null;
//		String username = "", password = "";
//		for (Cookie cookie : cookies) {
//			if (cookie.getName().equalsIgnoreCase("username")) {
//				username = cookie.getValue();
//			}
//			if (cookie.getName().equalsIgnoreCase("password")) {
//				password = cookie.getValue();
//			}
//		}
//		if (!username.isEmpty() && !password.isEmpty()) {
//			account = new AccountUserRoleDTO(username, password);
//		}
//		return account;
//	}
	
	public static String checkCookieAuthor(HttpServletRequest res) {
		Cookie[] cookies = res.getCookies();
		String token = "";
		if(cookies != null) {			
			for (Cookie cookie : cookies) {
				if (cookie.getName().equalsIgnoreCase("authorization")) {
					token = cookie.getValue();
				}
			}
		}
		return token;
	}
}
