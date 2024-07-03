package tp.kits3.comedians.model;

public class OrderDetail {

	private float total;
	
	public OrderDetail(String total) {
		this.total = Float.parseFloat(total);
	}
	
	public String getTotal() {
		return String.format("%.2f", total);
	}

	
}
