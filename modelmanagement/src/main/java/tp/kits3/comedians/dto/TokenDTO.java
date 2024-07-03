/**
 * @author giang
 */
package tp.kits3.comedians.dto;

public class TokenDTO {

	private int id;
	
	private String username;
	
	private int userid;

	public TokenDTO(int id, String username, int userid) {
		this.id = id;
		this.username = username;
		this.userid = userid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	
}
