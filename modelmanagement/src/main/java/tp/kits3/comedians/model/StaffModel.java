/**
 * 
 * @author sang
 *
 */
package tp.kits3.comedians.model;

import java.sql.Date;

public class StaffModel extends UserCommonModel{

    private Double coefficients_salary;
    
    private Date birthday;
	
    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

	public Double getCoefficients_salary() {
		return coefficients_salary;
	}

	public void setCoefficients_salary(Double coefficients_salary) {
		this.coefficients_salary = coefficients_salary;
	}
    
}
