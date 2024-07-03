package tp.kits3.comedians.dto;

import java.util.ArrayList;
import java.util.List;

public class CommonDTO {

	private int id;
	private List<Integer> ids = new ArrayList<Integer>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Integer> getIds() {
		return ids;
	}

	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}

}
