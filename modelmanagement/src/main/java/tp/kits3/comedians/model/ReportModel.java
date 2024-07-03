/**
 * 
 * @author sang
 *
 */
package tp.kits3.comedians.model;

public class ReportModel extends CommonModel {

	private Double spending;

	private int month;

	private int year;

	private Double income;

	private Double profit;


	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public Double getIncome() {
		return income;
	}

	public void setIncome(Double income) {
		this.income = income;
	}

	public Double getProfit() {
		return profit;
	}

	public void setProfit(Double profit) {
		this.profit = profit;
	}

	public Double getSpending() {
		return spending;
	}

	public void setSpending(Double spending) {
		this.spending = spending;
	}

}
