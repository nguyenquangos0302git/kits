/**
 * @author dung, sang
 */
package tp.kits3.comedians.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.IRankDao;
import tp.kits3.comedians.model.RankModel;
import tp.kits3.comedians.service.IRankService;

@Service
public class RankService implements IRankService {
	@Autowired
	private IRankDao rankDao;

	@Override
	public List<RankModel> findAll() {
		List<RankModel> list = rankDao.findAll();
		return list;
	}


	@Override
	public int insert(RankModel param) {
		int result = rankDao.insert(param);
		return result;
	}

	@Override
	public int update(RankModel param) {
		int result = rankDao.update(param);
		return result;

	}

	@Override
	public void delete(List<Integer> id) {
		rankDao.delete(id);

	}


	@Override
	public RankModel selectOne(int id) {
		// TODO Auto-generated method stub
		return rankDao.findById(id);
	}


	@Override
	public List<RankModel> selectRank() {
		// TODO Auto-generated method stub
		return rankDao.selectRank();
	}
	
	public List<RankModel> search(String name) {
		List<RankModel> list= rankDao.search(name);
		return list;
	}

	
}
