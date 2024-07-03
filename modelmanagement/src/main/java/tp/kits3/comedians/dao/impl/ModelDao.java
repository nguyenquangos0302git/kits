/**
 * @author loi, dung
 */
package tp.kits3.comedians.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IModelDao;
import tp.kits3.comedians.model.ModelModel;

@Repository
public class ModelDao extends CommonDao<ModelModel> implements IModelDao {

	@Override
	public List<ModelModel> findAll() {
		// TODO Auto-generated method stub
		return query("modelMapper", "selectAll");
	}

	@Override
	public ModelModel findOneById(int id) {
		List<ModelModel> list = query("modelMapper", "selectOneById", id);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public int insert(ModelModel model) {
		int result = insert("modelMapper", "insert", model);
		return result;
	}

	@Override
	public int update(ModelModel model) {
		int result = update("modelMapper", "update", model);
		return result;
	}

	@Override
	public void delete(List<Integer> ids) {
		delete("modelMapper", "delete", ids);
	}

	@Override
	public List<ModelModel> findTopModel() {
		return query("modelMapper", "selectAllSortByRating");
	}

	@Override
	public List<String> findImgTopModel() {
		return queryString("imagesMapper", "selectAllByModelId");
	}

	@Override
	public String findImgLinkByModelId(int modelId) {
		List<String> list = queryString("imagesMapper", "selectByModelId", modelId);
		return list.isEmpty() ? null : list.get(0);
	}
	
	// filter Age for search
	@Override
	public List<Integer> selectAge() {
		List<Integer> list = queryInt("modelMapper","selectAge");
		return list;
	}

	@Override
	public List<ModelModel> findAllByName(String name) {
		// TODO Auto-generated method stub
		return query("modelMapper", "selectAllByName", name);
	}

	@Override
	public List<ModelModel> findAll(int limit, int offset) {
		// TODO Auto-generated method stub
		return query("modelMapper", "selectAllModelLimit", limit, offset);
	}
	
	

}
