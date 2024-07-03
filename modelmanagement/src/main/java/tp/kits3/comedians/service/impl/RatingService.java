package tp.kits3.comedians.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.IContractDao;
import tp.kits3.comedians.dao.IRatingDao;
import tp.kits3.comedians.dto.RatingDTO;
import tp.kits3.comedians.model.ContractModel;
import tp.kits3.comedians.model.RatingModel;
import tp.kits3.comedians.service.IRatingService;

@Service
public class RatingService implements IRatingService {
	@Autowired
	IRatingDao iRatingDao;
	
	@Autowired
	private IContractDao contractDAO;

	@Override
	public List<RatingModel> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RatingModel selectOne(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(RatingModel ratingModel) {
		ContractModel conModel = contractDAO.findOneById(ratingModel.getContractid());
		conModel.setRatingstatus(true);
		contractDAO.update(conModel);
		iRatingDao.insert(ratingModel);
	}

	@Override
	public void update(RatingModel ratingModel) {
		// TODO Auto-generated method stub
		iRatingDao.update(ratingModel);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
	}

	@Override
	public int sumStar(int modelid) {
		// TODO Auto-generated method stub
		return iRatingDao.sumStar(modelid);
	}

	@Override
	public int countStarByModelid(int modelid) {
		// TODO Auto-generated method stub
		return iRatingDao.countStarByModelid(modelid);
	}

	@Override
	public int countStarByModelidStar(RatingModel ratingModel) {
		// TODO Auto-generated method stub
		return iRatingDao.countStarByModelidStar(ratingModel);
	}

	@Override
	public double avgStarModel(int modelid) {
		// TODO Auto-generated method stub
		return iRatingDao.avgStarModel(modelid);
	}

	@Override
	public List<Integer> findAllModelid() {
		// TODO Auto-generated method stub
		return iRatingDao.findAllModelid();
	}

	@Override
	public RatingDTO ratingModel(int modelid) {
		RatingDTO rating =new RatingDTO();
		RatingModel ratingModel = new RatingModel();
			ratingModel.setModelid(modelid);
			ratingModel.setStar(1);
			rating.setOneStar(countStarByModelidStar(ratingModel));
			ratingModel.setStar(2);
		rating.setTwoStar(countStarByModelidStar(ratingModel));
		ratingModel.setStar(3);
		rating.setThrStar(countStarByModelidStar(ratingModel));
		ratingModel.setStar(4);
		rating.setForStar(countStarByModelidStar(ratingModel));
		ratingModel.setStar(5);
		rating.setFivStar(countStarByModelidStar(ratingModel));
		rating.setSumStar(countStarByModelid(modelid));
		return rating;
	}

	@Override
	public RatingModel findRatingByAccountIdAndModelId(int accountid, int modelid) {
		int contractid = contractDAO.findContractIdByAccountIdAndModelId(accountid, modelid);
		return iRatingDao.findRatingByAccountIdAndModelId(accountid, modelid, contractid);
	}

	@Override
	public List<Integer> contractidByAccountidAndModelid(int accountid, int modelid) {
		// TODO Auto-generated method stub
		List<Integer> listConId = iRatingDao.contractidByAccountidAndModelid(accountid, modelid);
		List<Integer> listContractId = new ArrayList<Integer>();
		for(int i=0;i<listConId.size();i++) {
			if(iRatingDao.checkRatingByContractid(listConId.get(i)).isCheckrating()) {
				listContractId.add(listConId.get(i));
			}
		}
		return listContractId;
	}

	@Override
	public RatingModel checkRatingByContractid(int contractid) {
		// TODO Auto-generated method stub
		return iRatingDao.checkRatingByContractid(contractid);
	}

	@Override
	public List<RatingModel> addRating(int accountid, int modelid, int contractid) {
		// TODO Auto-generated method stub
		List<RatingModel> listRating = new ArrayList<RatingModel>();
		List<Integer> listConId = contractidByAccountidAndModelid(accountid, modelid);
		for(int i = 0;i<listConId.size();i++) {
			if(checkRatingByContractid(listConId.get(i)).isCheckrating()) {
				RatingModel rating = new RatingModel();
				rating.setContractid(contractid);
				rating.setModelid(modelid);
				rating.setAccountid(accountid);
				listRating.add(rating);
			}
		}
		
		return listRating;
	}

}
