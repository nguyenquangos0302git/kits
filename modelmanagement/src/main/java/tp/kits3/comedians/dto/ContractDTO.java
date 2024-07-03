/**
 * @author dung
 */
package tp.kits3.comedians.dto;
import java.sql.Timestamp;

import tp.kits3.comedians.model.CommonModel;

public class ContractDTO extends CommonModel {

	private int accountid;

	private String description;

	private int status;
	
	private String statusName;

	private Double totalprice;
	
	private String username;
	
	public ContractDTO() {
		
	}
	
	public ContractDTO(int id, int accountid, String description,int status, String statusName, Double totalprice, String username, Timestamp createdate, Timestamp modifieddate, String createdby, String modifiedby) {
		setId(id);
		this.accountid = accountid;
		this.description = description;
		this.status = status;
		this.statusName = statusName;
		this.totalprice = totalprice;
		this.username = username;
		setCreatedate(createdate);
		setModifieddate(modifieddate);
		setCreatedby(createdby);
		setModifiedby(modifiedby);
	}
	
	public Integer getAccountid() {
		return accountid;
	}

	public void setAccountid(int accountid) {
		this.accountid = accountid;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Double getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(Double totalprice) {
		this.totalprice = totalprice;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
}
