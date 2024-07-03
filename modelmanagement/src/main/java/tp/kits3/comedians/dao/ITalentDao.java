/**
 * @author loi
 */
package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.model.TalentModel;

public interface ITalentDao extends GenericDao<TalentModel> {
	List<TalentModel> findAll();

	List<TalentModel> findAllByName(String name);
	
	TalentModel findById(int id);

	int insert(TalentModel talent);

	int update(TalentModel talent);

	void delete(List<Integer> id);
}
