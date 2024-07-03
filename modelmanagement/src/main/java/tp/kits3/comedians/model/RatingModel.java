/**
 * 
 * @author sang
 *
 */
package tp.kits3.comedians.model;

public class RatingModel extends CommonModel {

	private int accountid;

	private int modelid;

	private int star;
	
	private int contractid;
	
	private boolean checkrating;

	public int getAccountid() {
		return accountid;
	}

	public void setAccountid(int accountid) {
		this.accountid = accountid;
	}

	public int getModelid() {
		return modelid;
	}

	public void setModelid(int modelid) {
		this.modelid = modelid;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getContractid() {
		return contractid;
	}

	public void setContractid(int contractid) {
		this.contractid = contractid;
	}

	public boolean isCheckrating() {
		return checkrating;
	}

	public void setCheckrating(boolean checkrating) {
		this.checkrating = checkrating;
	}

}
