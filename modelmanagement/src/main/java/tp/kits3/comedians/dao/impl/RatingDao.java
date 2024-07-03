package tp.kits3.comedians.dao.impl;


import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IRatingDao;
import tp.kits3.comedians.model.RatingModel;

@Repository
public class RatingDao extends CommonDao<RatingModel> implements IRatingDao{

	@Override
	public int sumStar(int modelid) {
		// TODO Auto-generated method stub
		List<Integer> list = queryInt("ratingMapper", "sumStarByModelid", modelid);
		if(list.size()>0) {
			return list.get(0);
		}else return 0;
		
	}

	@Override
	public int countStarByModelid(int modelid) {
		// TODO Auto-generated method stub
		return queryInt("ratingMapper", "countStarByModelid", modelid).isEmpty()? 0:queryInt("ratingMapper", "countStarByModelid", modelid).get(0);
	}

	@Override
	public int countStarByModelidStar(RatingModel ratingModel) {
		// TODO Auto-generated method stub
		return queryInt("ratingMapper", "countStarByModelidStar",ratingModel).isEmpty()? 0:queryInt("ratingMapper", "countStarByModelidStar",ratingModel).get(0);
	}

	@Override
	public void insert(RatingModel ratingModel) {
		// TODO Auto-generated method stub
		query("ratingMapper", "insert", ratingModel);
	}

	@Override
	public void update(RatingModel ratingModel) {
		// TODO Auto-generated method stub
		query("ratingMapper", "update", ratingModel);
	}

	@Override
	public double avgStarModel(int modelid) {
		// TODO Auto-generated method stub
		return queryDouble("ratingMapper", "avgStarModel", modelid).isEmpty()?0:queryDouble("ratingMapper", "avgStarModel", modelid).get(0);
	}

	@Override
	public List<Integer> findAllModelid() {
		// TODO Auto-generated method stub
		return queryInt("ratingMapper", "findAllModelid");
	}

	@Override
	public RatingModel findRatingByAccountIdAndModelId(int accountid, int modelid,int contractid) {
		List<RatingModel> ratingModel = query("ratingMapper", "findRatingByAccountIdAndModelId",accountid,modelid,contractid );
		return ratingModel.isEmpty() ? null : ratingModel.get(0) ;
	}

	@Override
	public List<Integer> contractidByAccountidAndModelid(int accountid, int modelid) {
		// TODO Auto-generated method stub
		return queryInt("ratingMapper", "findContractidByAccountidAndModelid", accountid,modelid);
	}

	@Override
	public RatingModel checkRatingByContractid(int contractid) {
		// TODO Auto-generated method stub
		RatingModel ratingModel = new RatingModel();
		ratingModel.setCheckrating(false);
		return query("ratingMapper", "checkratingByContractid", contractid).isEmpty()? ratingModel : query("ratingMapper", "checkratingByContractid", contractid).get(0);
	}

}
