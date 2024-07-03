/**
 * 
 * @author sang
 *
 */
package tp.kits3.comedians.model;

import java.sql.Timestamp;

public class AccountModel extends CommonModel{

	  	private String username;

	    private String password;

	    private String email;
	    
	    private int status;
	    
	    private int codeverification;
	    
	    private Timestamp expiredcode;
	    
	    private String note;

	    public String getUsername() {
	        return username;
	    }

	    public void setUsername(String username) {
	        this.username = username;
	    }

	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password;
	    }

	    public int getStatus() {
	        return status;
	    }

	    public void setStatus(int status) {
	        this.status = status;
	    }

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public int getCodeverification() {
			return codeverification;
		}

		public void setCodeverification(int codeverification) {
			this.codeverification = codeverification;
		}

		public Timestamp getExpiredcode() {
			return expiredcode;
		}

		public void setExpiredcode(Timestamp expiredcode) {
			this.expiredcode = expiredcode;
		}

		public String getNote() {
			return note;
		}

		public void setNote(String note) {
			this.note = note;
		}
}
