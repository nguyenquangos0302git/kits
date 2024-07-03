/**
 * 
 * @author sang
 *
 */
package tp.kits3.comedians.model;

public class CartModel extends CommonModel {

	private Integer modelid;

	private Integer accountid;
	
	private double price;
	
	private int day;

	public Integer getModelid() {
		return modelid;
	}

	public void setModelid(Integer modelid) {
		this.modelid = modelid;
	}

	public Integer getAccountid() {
		return accountid;
	}

	public void setAccountid(Integer accountid) {
		this.accountid = accountid;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	
}
