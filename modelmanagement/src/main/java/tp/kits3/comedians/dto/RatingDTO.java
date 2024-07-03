package tp.kits3.comedians.dto;

import tp.kits3.comedians.model.CommonModel;

public class RatingDTO extends CommonModel {
	private int oneStar;

	private int twoStar;
	private int thrStar;
	private int forStar;
	private int fivStar;
	private int sumStar;
	
	public RatingDTO() {
		
	}
	
	public RatingDTO(int oneStar, int twoStar, int thrStar, int forStar, int fivStar, int sumStar) {
		this.oneStar = oneStar;
		this.twoStar = twoStar;
		this.thrStar = thrStar;
		this.forStar = forStar;
		this.fivStar = fivStar;
		this.sumStar = sumStar;
	}
	public int getOneStar() {
		return oneStar;
	}
	public void setOneStar(int oneStar) {
		this.oneStar = oneStar;
	}
	public int getTwoStar() {
		return twoStar;
	}
	public void setTwoStar(int twoStar) {
		this.twoStar = twoStar;
	}
	public int getThrStar() {
		return thrStar;
	}
	public void setThrStar(int thrStar) {
		this.thrStar = thrStar;
	}
	public int getForStar() {
		return forStar;
	}
	public void setForStar(int forStar) {
		this.forStar = forStar;
	}
	public int getFivStar() {
		return fivStar;
	}
	public void setFivStar(int fivStar) {
		this.fivStar = fivStar;
	}
	public int getSumStar() {
		return sumStar;
	}
	public void setSumStar(int sumStarr) {
		this.sumStar = sumStarr;
	}
	public int getCoutRating() {
		return coutRating;
	}
	public void setCoutRating(int coutRating) {
		this.coutRating = coutRating;
	}
	private int coutRating;
	
	
}
