/**
 * @author Giang
 */
package tp.kits3.comedians.dto;

import java.util.Date;

public class CommentDTO extends CommonDTO {

	private int accountid;
	
	private int parentid;
	
	private String content;
	
	private String username;
	
	
	private String commenttime;
	
	private String avatar;
	
	private int childcomment;

	private Date createdate;
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCommenttime() {
		return commenttime;
	}

	public void setCommenttime(String commenttime) {
		this.commenttime = commenttime;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public int getAccountid() {
		return accountid;
	}

	public void setAccountid(int accountid) {
		this.accountid = accountid;
	}

	public int getParentid() {
		return parentid;
	}

	public void setParentid(int parentid) {
		this.parentid = parentid;
	}

	public int getChildcomment() {
		return childcomment;
	}

	public void setChildcomment(int childcomment) {
		this.childcomment = childcomment;
	}
}
