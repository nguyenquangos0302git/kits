/**
 * @author dung, loi
 */
package tp.kits3.comedians.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.ITalentDao;
import tp.kits3.comedians.model.TalentModel;
import tp.kits3.comedians.service.ITalentService;

@Service
public class TalentService implements ITalentService {

	@Autowired
	private ITalentDao talentDao;
	@Override
	public List<TalentModel> findAll() {
		// TODO Auto-generated method stub
		List<TalentModel> list = talentDao.findAll();
		return list;
	}

	@Override
	public TalentModel selectOne(int id) {
		// TODO Auto-generated method stub
		return talentDao.findById(id);
	}

	@Override
	public int insert(TalentModel param) {
		// TODO Auto-generated method stub
		int result = talentDao.insert(param);
		return result;
	}

	@Override
	public int update(TalentModel param) {
		// TODO Auto-generated method stub
		
		int result = talentDao.update(param);
		return result;
	}

	@Override
	public void delete(List<Integer> id) {
		// TODO Auto-generated method stub
		talentDao.delete(id);
	}

	@Override
	public List<TalentModel> findAllByName(String name) {
		return talentDao.findAllByName(name);
	}

}
