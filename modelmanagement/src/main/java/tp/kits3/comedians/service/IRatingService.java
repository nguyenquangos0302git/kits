/**
 * @author dung
 */
package tp.kits3.comedians.service;

import java.util.List;

import tp.kits3.comedians.dto.RatingDTO;
import tp.kits3.comedians.model.RatingModel;

public interface IRatingService {
	List<RatingModel> findAll();
	RatingModel selectOne(int id);
	void insert(RatingModel ratingModel);
	void update(RatingModel param);
	void delete(int id);
	int sumStar(int modelid);
	int countStarByModelid(int modelid);
	int countStarByModelidStar(RatingModel ratingModel);
	double avgStarModel(int modelid);
	List<Integer> findAllModelid();
	RatingDTO ratingModel(int modelid);
	RatingModel findRatingByAccountIdAndModelId(int accountid,int modelid);
	List<Integer> contractidByAccountidAndModelid(int accountid, int modelid);
	RatingModel checkRatingByContractid(int contractid);
	List<RatingModel> addRating(int accountid,int modelid,int contractid);
}
