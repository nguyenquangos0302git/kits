/**
 * 
 * @author sang
 *
 */
package tp.kits3.comedians.model;

public class RoleModel extends CommonModel{
	
	private String name;
	
	private String description;
	
	private Double salary;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getSalary() {
		return salary;
	}

	public void setSalary(Double salary) {
		this.salary = salary;
	}
}
