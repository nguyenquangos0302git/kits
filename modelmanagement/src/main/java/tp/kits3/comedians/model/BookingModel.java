package tp.kits3.comedians.model;

public class BookingModel extends CommonModel{

	private int accountid;
	
	private int modelid;
	
	private int startdate;
	
	private int startmonth;
	
	private int startyear;
	
	private int enddate;
	
	private boolean status;

	public int getAccountid() {
		return accountid;
	}

	public void setAccountid(int accountid) {
		this.accountid = accountid;
	}

	public int getModelid() {
		return modelid;
	}

	public void setModelid(int modelid) {
		this.modelid = modelid;
	}

	public int getStartdate() {
		return startdate;
	}

	public void setStartdate(int startdate) {
		this.startdate = startdate;
	}

	public int getStartmonth() {
		return startmonth;
	}

	public void setStartmonth(int startmonth) {
		this.startmonth = startmonth;
	}

	public int getStartyear() {
		return startyear;
	}

	public void setStartyear(int startyear) {
		this.startyear = startyear;
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public int getEnddate() {
		return enddate;
	}

	public void setEnddate(int enddate) {
		this.enddate = enddate;
	}
	
}
