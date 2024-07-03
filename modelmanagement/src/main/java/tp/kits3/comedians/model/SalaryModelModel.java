/**
 * 
 * @author sang
 *
 */
package tp.kits3.comedians.model;

public class SalaryModelModel extends CommonModel {
	
	private int month;

	private Double salary;

	private int year;
	
	private int modelid;

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public Double getSalary() {
		return salary;
	}

	public void setSalary(Double salary) {
		this.salary = salary;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getModelid() {
		return modelid;
	}

	public void setModelid(int modelid) {
		this.modelid = modelid;
	}
}
