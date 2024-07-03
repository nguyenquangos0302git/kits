/**
 * 
 * @author sang
 *
 */
package tp.kits3.comedians.model;

public class ContractDetailModel extends CommonModel {

	private int contractid;

	private String detail;

	private int modelid;
	
	private int day;
	
	private double price;

	public int getContractid() {
		return contractid;
	}

	public void setContractid(int contractid) {
		this.contractid = contractid;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Integer getModelid() {
		return modelid;
	}

	public void setModelid(Integer modelid) {
		this.modelid = modelid;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public void setModelid(int modelid) {
		this.modelid = modelid;
	}

	
}
