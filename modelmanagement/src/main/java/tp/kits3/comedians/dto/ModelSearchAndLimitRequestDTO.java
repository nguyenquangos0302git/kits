package tp.kits3.comedians.dto;

import java.util.List;

public class ModelSearchAndLimitRequestDTO {

	private List<Integer> talent;
	
	private List<Integer> rank;
	
	private String name;
	
	private int age;
	
	private int talentsize;
	
	private int limit;
	
	private int offset;
	
	private String type;
	
	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public List<Integer> getTalent() {
		return talent;
	}

	public void setTalent(List<Integer> talent) {
		this.talent = talent;
	}

	public List<Integer> getRank() {
		return rank;
	}

	public void setRank(List<Integer> rank) {
		this.rank = rank;
	}

	public int getTalentsize() {
		return talentsize;
	}

	public void setTalentsize(int talentsize) {
		this.talentsize = talentsize;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
}
