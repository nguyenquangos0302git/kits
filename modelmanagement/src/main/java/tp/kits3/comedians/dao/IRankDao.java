/**
 * @author loi, sang
 */
package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.model.RankModel;

public interface IRankDao extends GenericDao<RankModel> {
	List<RankModel> findAll();

	RankModel findByName(RankModel rankModel);

	int insert(RankModel rankModel);

	int update(RankModel rankModel);

	void delete(List<Integer> id);

	RankModel findById(int id);
	
	List<RankModel> selectRank();

	List<RankModel> search(String name);
}
