package tp.kits3.comedians.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class AccountUserRoleDTO {

	private int id;

	private int userId;

	private String username;

	private String password;

	private String repassword;

	private String email;

	private int status;

	private int codeverification;

	private Timestamp expiredcode;

	private String address;

	private String phone;

	private String company;

	private String idcard;

	private Boolean gender;

	private String avatar;

	private String name;

	private double salary;

	private Timestamp createdate;

	private Timestamp modifieddate;

	private String createdby;

	private String modifiedby;

	private String note;

	private boolean agreeterm;

	private boolean remember;

	private List<String> roles = new ArrayList<String>();

	private List<Integer> ids = new ArrayList<Integer>();

	private List<Integer> roleids = new ArrayList<Integer>();

	private String base64;

	private Double coefficients_salary;

	private Date birthday;

	private int staffid;

	private int month;

	private int countCart;

	public AccountUserRoleDTO() {
	}

	public AccountUserRoleDTO(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public AccountUserRoleDTO(int id, int userid, String username, String password, String email, String name,
			String phone, Boolean gender,String avatar, String address, String company) {
		this.id = id;
		this.userId = userid;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.name = name;
		this.avatar = avatar;
		this.address = address;
		this.company = company;
	}

	public Double getCoefficients_salary() {
		return coefficients_salary;
	}

	public void setCoefficients_salary(Double coefficients_salary) {
		this.coefficients_salary = coefficients_salary;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public int getStaffid() {
		return staffid;
	}

	public void setStaffid(int staffid) {
		this.staffid = staffid;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public List<Integer> getRoleids() {
		return roleids;
	}

	public void setRoleids(List<Integer> roleids) {
		this.roleids = roleids;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getCodeverification() {
		return codeverification;
	}

	public void setCodeverification(int codeverification) {
		this.codeverification = codeverification;
	}

	public Timestamp getExpiredcode() {
		return expiredcode;
	}

	public void setExpiredcode(Timestamp expiredcode) {
		this.expiredcode = expiredcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public List<String> getRoles() {
		return roles;
	}

	public void setRoles(List<String> roles) {
		this.roles = roles;
	}

	public List<Integer> getIds() {
		return ids;
	}

	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}

	public Timestamp getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Timestamp createdate) {
		this.createdate = createdate;
	}

	public Timestamp getModifieddate() {
		return modifieddate;
	}

	public void setModifieddate(Timestamp modifieddate) {
		this.modifieddate = modifieddate;
	}

	public String getCreatedby() {
		return createdby;
	}

	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}

	public String getModifiedby() {
		return modifiedby;
	}

	public void setModifiedby(String modifiedby) {
		this.modifiedby = modifiedby;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public boolean isRemember() {
		return remember;
	}

	public void setRemember(boolean remember) {
		this.remember = remember;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public boolean isAgreeterm() {
		return agreeterm;
	}

	public void setAgreeterm(boolean agreeterm) {
		this.agreeterm = agreeterm;
	}

	public String getBase64() {
		// return base64.split(",")[1];
		return base64;
	}

	public void setBase64(String base64) {
		this.base64 = base64;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getCountCart() {
		return countCart;
	}

	public void setCountCart(int countCart) {
		this.countCart = countCart;
	}

}
