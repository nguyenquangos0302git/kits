/**
 * @author dung
 */
package tp.kits3.comedians.dto;


public class ReportDTO extends CommonDTO{
	private int weekOrders;
	private int beforeWeekOrders;
	private double weekSales;
	private double beforeWeekSales;
	private double compareSales;
	private double compareOrders;
	public ReportDTO() {
		
	}
	
	public ReportDTO(int weekOrders, int beforeWeekOrders,double weekSales, double beforeWeekSales,double compareSales,double compareOrders) {
		this.weekOrders = weekOrders;
		this.beforeWeekOrders = beforeWeekOrders;
		this.weekSales = weekSales;
		this.beforeWeekSales = beforeWeekSales;
		this.compareSales = compareSales;
		this.compareOrders = compareOrders;
	}
	public int getWeekOrders() {
		return weekOrders;
	}
	public void setWeekOrders(int weekOrders) {
		this.weekOrders = weekOrders;
	}
	public int getBeforeWeekOrders() {
		return beforeWeekOrders;
	}
	public void setBeforeWeekOrders(int beforeWeekOrders) {
		this.beforeWeekOrders = beforeWeekOrders;
	}
	public double getWeekSales() {
		return weekSales;
	}
	public void setWeekSales(double weekSales) {
		this.weekSales = weekSales;
	}
	public double getBeforeWeekSales() {
		return beforeWeekSales;
	}
	public void setBeforeWeekSales(double beforeWeekSales) {
		this.beforeWeekSales = beforeWeekSales;
	}

	public double getCompareSales() {
		return compareSales;
	}

	public void setCompareSales(double compareSales) {
		this.compareSales = compareSales;
	}

	public double getCompareOrders() {
		return compareOrders;
	}

	public void setCompareOrders(double compareOrders) {
		this.compareOrders = compareOrders;
	}

}