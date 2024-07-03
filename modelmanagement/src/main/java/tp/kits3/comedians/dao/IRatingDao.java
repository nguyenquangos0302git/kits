package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.model.RatingModel;

public interface IRatingDao extends GenericDao<RatingModel> {
	List<Integer> findAllModelid();
	double avgStarModel(int modelid);
	void insert(RatingModel ratingModel);
	void update(RatingModel ratingModel);
	int sumStar(int modelid);
	int countStarByModelid(int modelid);
	int countStarByModelidStar(RatingModel ratingModel);
	RatingModel  findRatingByAccountIdAndModelId(int accountid,int modelid, int contractid);
	List<Integer> contractidByAccountidAndModelid(int accountid, int modelid);
	RatingModel checkRatingByContractid(int contractid);
}
