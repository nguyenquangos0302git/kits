/**
 * @author dung, loi
 */
package tp.kits3.comedians.service;

import java.util.List;

import tp.kits3.comedians.model.TalentModel;

public interface ITalentService {
	List<TalentModel> findAll();
	List<TalentModel> findAllByName(String name);
	TalentModel selectOne(int id);
	int insert(TalentModel param);
	int update(TalentModel param);
	void delete(List<Integer> id);
}
