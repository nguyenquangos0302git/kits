/**
 * @author loi
 */
package tp.kits3.comedians.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.ITalentDao;
import tp.kits3.comedians.model.TalentModel;

@Repository
public class TalentDao extends CommonDao<TalentModel> implements ITalentDao  {

	@Override
	public List<TalentModel> findAll() {
		// TODO Auto-generated method stub
		return query("talentMapper", "selectAll");
	}

	@Override
	public TalentModel findById(int id) {
		// TODO Auto-generated method stub
		List<TalentModel> list = query("talentMapper", "selectById", id);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public int insert(TalentModel talent) {
		// TODO Auto-generated method stub
		int result = insert("talentMapper", "insert", talent);
		return result;
	}

	@Override
	public int update(TalentModel talent) {
		// TODO Auto-generated method stub
		int result = update("talentMapper", "update", talent);
		return result;
	}

	@Override
	public void delete(List<Integer> id) {
		// TODO Auto-generated method stub
		delete("talentMapper", "delete", id);
	}

	@Override
	public List<TalentModel> findAllByName(String name) {
		return query("talentMapper", "selectAllByName", name);
	}

}
