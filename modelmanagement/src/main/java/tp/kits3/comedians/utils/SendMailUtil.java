/**
 * @author quang
 */
package tp.kits3.comedians.utils;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import tp.kits3.comedians.constant.SystemConstant;

public class SendMailUtil {

	public static void sendMail(String emailUser, int verifyCode) {
		 
        Email email = new SimpleEmail();
 
        email.setHostName(SystemConstant.HOST_NAME);
        email.setSmtpPort(SystemConstant.SSL_PORT);
        email.setAuthenticator(new DefaultAuthenticator(SystemConstant.APP_EMAIL, SystemConstant.APP_PASSWORD));
        email.setSSLOnConnect(true);
 
        try {
			email.setFrom(SystemConstant.APP_EMAIL);
			email.addTo(emailUser);
			email.setMsg("Verify code: " + verifyCode);
			email.setSubject("Welcome to model management");
			email.send(); 
		} catch (EmailException e) {
			e.printStackTrace(); 
		}
 
    }
	
	public static void sendMailStaffAccount(String emailUser, int verifyCode, String password, String username) {
		 
        Email email = new SimpleEmail();
 
        email.setHostName(SystemConstant.HOST_NAME);
        email.setSmtpPort(SystemConstant.SSL_PORT);
        email.setAuthenticator(new DefaultAuthenticator(SystemConstant.APP_EMAIL, SystemConstant.APP_PASSWORD));
        email.setSSLOnConnect(true);
        
        StringBuilder message = new StringBuilder();
        message.append("welcome to model management\n");
        message.append("Please do the following\n");
        message.append("First. You need to verify your account. Your code: " + verifyCode + "\n");
        message.append("Change your password. Your password: " + password);
        message.append("username for login. Your username: " + username);
        message.append("Thank!");
        
        try {
			email.setFrom(SystemConstant.APP_EMAIL);
			email.addTo(emailUser);
			email.setMsg(message.toString());
			email.setSubject("Welcome to model management");
			email.send(); 
		} catch (EmailException e) {
			e.printStackTrace(); 
		}
 
    }
	
}
