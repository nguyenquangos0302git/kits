/**
 * @author dung, sang
 */
package tp.kits3.comedians.service;

import java.util.List;

import tp.kits3.comedians.model.RankModel;

public interface IRankService {
	List<RankModel> findAll();

	RankModel selectOne(int id);

	int insert(RankModel param);

	int update(RankModel param);

	void delete(List<Integer> id);
	
	List<RankModel> selectRank();
	 
	List<RankModel> search(String name);
}
