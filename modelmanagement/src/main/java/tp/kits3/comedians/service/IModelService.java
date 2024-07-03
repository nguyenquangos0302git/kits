/**
 * @author dung
 */
package tp.kits3.comedians.service;

import java.util.List;

import tp.kits3.comedians.dto.ModelDTO;
import tp.kits3.comedians.dto.ModelSearchAndLimitRequestDTO;
import tp.kits3.comedians.model.ModelModel;

public interface IModelService {
	
	List<ModelDTO> findAllModel();
	
	List<ModelDTO> findTopTenModel();
	
	List<ModelDTO> findAllModelDTO();
	
	List<ModelDTO> searchShowAllAdmin(String name);

	List<ModelModel> findAll();

	ModelModel findById(int id);
	
	ModelDTO findModelById(int id);

	int insert(ModelModel model);

	int update(ModelModel model);

	void delete(List<Integer> ids);

	List<ModelDTO> findMales();

	List<ModelDTO> findFemales();

	List<ModelDTO> findNewFace();
	
	List<ModelDTO> findKids();
	
	List<Integer> selectAge();
	
	List<ModelModel> findAllByName(String name);
	
	List<ModelDTO> selectTalent(int modelid);

	List<String> multiImage(int modelid);
	
	List<ModelDTO> findAllModel(int limit, int offset);
	
	List<ModelDTO> findMales(int limit, int offset);

	List<ModelDTO> findFemales(int limit, int offset);

	List<ModelDTO> findNewFace(int limit, int offset);
	
	List<ModelDTO> findKids(int limit, int offset);
	
	List<ModelDTO> findAllModelNotLimit(ModelSearchAndLimitRequestDTO model);
	
	List<ModelDTO> findAllModelAndLimit(ModelSearchAndLimitRequestDTO model);
}
