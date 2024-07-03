package tp.kits3.comedians.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class ModelDTO extends CommonDTO {

	private String name;
	
	private String address;
	
	private String email;
	
	private String phone;
	
	private String talent;

	private String imgLink;
	
	private String listImages;

	private Double height;

	private Double weight;

	private int age;
	
	private Date birthday;

	private String gender;

	private String nation;

	private String description;

	private Double price;
	
	private String rank;
	
	private Double chest;

	private Double hip;

	private Double waist;
	
	private Double rating;
	
	private int status;
	
	private String showonhome;
	
	private Timestamp createdate;
	
	private Timestamp modifieddate;
	
	private String createdby;
	
	private String modifiedby;
	
	public ModelDTO() {
	}
	
	public ModelDTO(int id, String name) {
		setId(id);
		this.name = name;
	}
	
	public ModelDTO(int id, String name, String imgLink, int age, Double height, Double weight, String gender,
			String nation, int status, Boolean showonhome, String description, Double chest, Double hip, Double waist, String rank) {
		setId(id);
		this.name = name;
		this.imgLink = imgLink;
		this.age = age;
		this.height = height;
		this.weight = weight;
		this.gender = gender;
		this.nation = nation;
		this.description = description;
		this.chest = chest;
		this.hip = hip;
		this.waist = waist;
		this.rank = rank;
	}
	
	public ModelDTO(int id, String name, String address, String email, String phone,  String rank, Double rating, Date birthday, 
			String gender, String nation, int status, String showonhome, Timestamp createdate, Timestamp modifieddate,
			 String createdby, String modifiedby) {
		setId(id);
		this.name = name;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.rank = rank;
		this.rating = rating;
		this.birthday = birthday;
		this.gender = gender;
		this.nation = nation;
		this.status = status;
		this.showonhome = showonhome;
		this.createdate = createdate;
		this.modifieddate = modifieddate;
		this.createdby = createdby;
		this.modifiedby = modifiedby;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getImgLink() {
		return imgLink;
	}

	public void setImgLink(String imgLink) {
		this.imgLink = imgLink;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getHeight() {
		return height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getChest() {
		return chest;
	}

	public void setChest(Double chest) {
		this.chest = chest;
	}

	public Double getHip() {
		return hip;
	}

	public void setHip(Double hip) {
		this.hip = hip;
	}

	public Double getWaist() {
		return waist;
	}

	public void setWaist(Double waist) {
		this.waist = waist;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}
	
	public Double getRating() {
		return rating;
	}
	
	public void setRating(Double rating) {
		this.rating = rating;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getShowonhome() {
		return showonhome;
	}

	public void setShowonhome(String showonhome) {
		this.showonhome = showonhome;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getTalent() {
		return talent;
	}

	public void setTalent(String talent) {
		this.talent = talent;
	}

	public String getListImages() {
		return listImages;
	}

	public void setListImages(String listImages) {
		this.listImages = listImages;
	}

}
