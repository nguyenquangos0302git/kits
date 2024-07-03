/**
 * 
 * @author sang
 *
 */
package tp.kits3.comedians.model;

import java.sql.Timestamp;

public class CommentModel extends CommonModel {

	private String content;
	
	private Integer accountid;
	
	private Integer modelid;
	
	private Integer parentid;

	private Timestamp commenttime;

	public Timestamp getCommenttime() {
		return commenttime;
	}

	public void setCommenttime(Timestamp commenttime) {
		this.commenttime = commenttime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getAccountid() {
		return accountid;
	}

	public void setAccountid(Integer accountid) {
		this.accountid = accountid;
	}

	public Integer getModelid() {
		return modelid;
	}

	public void setModelid(Integer modelid) {
		this.modelid = modelid;
	}

	public Integer getParentid() {
		return parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	
}
