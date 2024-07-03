/**
 * @author loi, sang
 */
package tp.kits3.comedians.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IRankDao;
import tp.kits3.comedians.model.RankModel;

@Repository
public class RankDao extends CommonDao<RankModel> implements IRankDao {

	@Override
	public List<RankModel> findAll() {
		return query("rankMapper", "selectAll");
	}

	@Override
	public RankModel findByName(RankModel rankModel) {

		return null;
	}


	@Override
	public int insert(RankModel rankModel) {
		int result = insert("rankMapper", "insert", rankModel);
		return result;
	}

	@Override
	public int update(RankModel rankModel) {
		int result = update("rankMapper", "update", rankModel);
		return result;
	}

	@Override
	public void delete(List<Integer> id) {
		delete("rankMapper", "delete", id);
	}

	@Override
	public RankModel findById(int id) {
		List<RankModel> list = query("rankMapper", "selectById", id);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public List<RankModel> selectRank() {
		List<RankModel> list = query("rankMapper", "selectRank");
		return list;
	}
	
	public List<RankModel> search(String name) {
		List<RankModel> list = query("rankMapper", "search",name);
		return list;
		
	}
}
