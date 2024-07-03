/**
 * 
 * @author sang
 *
 */
package tp.kits3.comedians.model;

public class ContractModel extends CommonModel {

	private Integer accountid;

	private String description;

	private int status;

	private Double totalprice;
	
	private boolean ratingstatus;

	public Integer getAccountid() {
		return accountid;
	}

	public void setAccountid(Integer accountid) {
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

	public boolean isRatingstatus() {
		return ratingstatus;
	}

	public void setRatingstatus(boolean ratingstatus) {
		this.ratingstatus = ratingstatus;
	}

}
