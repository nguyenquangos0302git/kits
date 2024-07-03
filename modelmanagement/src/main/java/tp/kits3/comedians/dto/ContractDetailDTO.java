/**
 * @author dung,giang
 */
package tp.kits3.comedians.dto;

import java.sql.Timestamp;
import java.util.List;

import tp.kits3.comedians.model.CommonModel;

public class ContractDetailDTO extends CommonModel {
	private int contractid;
	private String detail;
	private String name;
	private List<Integer> listContractId;
	private List<ModelDTO> modelDTO;
	private Timestamp createdate;
	private int status;
	private String username;
	private String staffname;
	private String useraddress;
	private String staffaddress;
	private String email;
	private String userphone;
	private String staffphone;
	private String modelname;
	private String description;
	private String rank;

	public ContractDetailDTO() {

	}

	public List<ModelDTO> getModelDTO() {
		return modelDTO;
	}

	public void setModelDTO(List<ModelDTO> modelDTO) {
		this.modelDTO = modelDTO;
	}

	public ContractDetailDTO(int id, int contractid, String detail, String name, Timestamp createdate,
			Timestamp modifieddate, String createdby, String modifiedby,int status) {
		setId(id);
		this.contractid = contractid;
		this.detail = detail;
		this.name = name;
		setCreatedate(createdate);
		setModifieddate(modifieddate);
		setCreatedby(createdby);
		setModifiedby(modifiedby);
		this.status = status;
	}

	public ContractDetailDTO(int id, int contractid, String detail, String name, Timestamp createdate,
			Timestamp modifieddate, String createdby, String modifiedby, List<Integer> listContractId,
			List<ModelDTO> modelDTO,int status) {
		setId(id);
		this.contractid = contractid;
		this.detail = detail;
		this.name = name;
		setCreatedate(createdate);
		setModifieddate(modifieddate);
		setCreatedby(createdby);
		setModifiedby(modifiedby);
		this.listContractId = listContractId;
		this.modelDTO = modelDTO;
		this.status = status;
	}

	public List<Integer> getListContractId() {
		return listContractId;
	}

	public void setListContractId(List<Integer> listContractId) {
		this.listContractId = listContractId;
	}

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Timestamp createdate) {
		this.createdate = createdate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getStaffname() {
		return staffname;
	}

	public void setStaffname(String staffname) {
		this.staffname = staffname;
	}

	public String getUseraddress() {
		return useraddress;
	}

	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}

	public String getStaffaddress() {
		return staffaddress;
	}

	public void setStaffaddress(String staffaddress) {
		this.staffaddress = staffaddress;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public String getStaffphone() {
		return staffphone;
	}

	public void setStaffphone(String staffphone) {
		this.staffphone = staffphone;
	}

	public String getModelname() {
		return modelname;
	}

	public void setModelname(String modelname) {
		this.modelname = modelname;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	
}
