/**
 * @author loi, dung
 */
package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.model.ModelModel;

public interface IModelDao extends GenericDao<ModelModel>{
	
	List<ModelModel> findAll();
	
	String findImgLinkByModelId(int modelId);
	
	List<ModelModel> findTopModel();
	
	List<String> findImgTopModel();
	
	ModelModel findOneById(int ids);
	
	int insert(ModelModel model);
	
	int update(ModelModel model);
	
	void delete(List<Integer> ids);
	
	List<Integer> selectAge();
	
	List<ModelModel> findAllByName(String name);
	
	List<ModelModel> findAll(int limit, int offset);
}
