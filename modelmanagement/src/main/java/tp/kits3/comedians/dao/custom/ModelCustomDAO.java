package tp.kits3.comedians.dao.custom;

import java.util.List;
import org.springframework.stereotype.Repository;
import tp.kits3.comedians.dao.IModelCustomDAO;
import tp.kits3.comedians.dao.impl.CommonDao;
import tp.kits3.comedians.dto.ModelDTO;
import tp.kits3.comedians.dto.ModelSearchAndLimitRequestDTO;

@Repository
public class ModelCustomDAO extends CommonDao<ModelDTO> implements IModelCustomDAO {

	@Override
	public List<ModelDTO> findTopTenModel() {
		return query("modelMapper", "selectTopTenModel");
	}

	@Override
	public ModelDTO findOneById(int id) {
		List<ModelDTO> list = query("modelMapper", "selectById", id);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public List<ModelDTO> searchShowAllAmin(String name) {
		return query("modelMapper", "searchShowAmin", name);
	}

	@Override
	public List<ModelDTO> findAllModelDTO() {
		// TODO Auto-generated method stub
		return query("modelMapper", "selectAllDTO");
	}

	public List<ModelDTO> findAllModel() {
		return query("modelMapper", "selectAllModel");
	}

	@Override
	public List<ModelDTO> findAllMaleModel() {
		return query("modelMapper", "selectModelByMale");
	}

	@Override
	public List<ModelDTO> findAllFemaleModel() {
		return query("modelMapper", "selectModelByFemale");
	}

	@Override
	public List<ModelDTO> findAllNewModel() {
		return query("modelMapper", "selectModelByNewFaces");
	}

	@Override
	public List<ModelDTO> selectTalent(int modelid) {
		
		return query("modelMapper", "selectTalent", modelid);
	}

	@Override
	public List<String> multiImage(int modelid) {
		return queryString("modelMapper","multiImages", modelid);
	}

	@Override
	public List<ModelDTO> findAllKid() {
		return query("modelMapper", "selectModelByKid");
	}

	@Override
	public List<ModelDTO> findAll(int limit, int offset) {
		// TODO Auto-generated method stub
		return query("modelMapper", "selectAllModelLimit", limit, offset);
	}

	@Override
	public List<ModelDTO> findAllMaleModelLimit(int limit, int offset) {
		// TODO Auto-generated method stub
		return query("modelMapper", "selectModelByMaleLimit", limit, offset);
	}

	@Override
	public List<ModelDTO> findAllFemaleModelLimit(int limit, int offset) {
		// TODO Auto-generated method stub
		return query("modelMapper", "selectModelByFemaleLimit", limit, offset);
	}

	@Override
	public List<ModelDTO> findAllNewModelLimit(int limit, int offset) {
		// TODO Auto-generated method stub
		return query("modelMapper", "selectModelByNewFacesLimit", limit, offset);
	}

	@Override
	public List<ModelDTO> findAllKidLimit(int limit, int offset) {
		// TODO Auto-generated method stub
		return query("modelMapper", "selectModelByKidLimit", limit, offset);
	}

	@Override
	public List<ModelDTO> findAllAndSearchAndLimitAndOffset(ModelSearchAndLimitRequestDTO model) {
//		SqlSession session = Connection.getInstance().openSession();
//		ModelDTO modelDTO = null;
//		modelDTO = session.getMapper(modelDTO.getClass());
//		List<ModelDTO> list = modelDTO.
		return query("modelMapper", "selectAllModelAndSearchAndLimitAndOffset", model);
	}

	@Override
	public List<ModelDTO> findAllAndSearch(ModelSearchAndLimitRequestDTO model) {
		// TODO Auto-generated method stub
		return query("modelMapper", "selectAllModelAndSearch", model);
	}

	@Override
	public List<ModelDTO> findMaleSearchAndLimitAndOffset(ModelSearchAndLimitRequestDTO model) {
		return query("modelMapper", "selectMaleModelAndSearchAndLimitAndOffset", model);
	}

	@Override
	public List<ModelDTO> findFemaleAndSearchAndLimitAndOffset(ModelSearchAndLimitRequestDTO model) {
		return query("modelMapper", "selectFemaleModelAndSearchAndLimitAndOffset", model);
	}

	@Override
	public List<ModelDTO> findKidsAndSearchAndLimitAndOffset(ModelSearchAndLimitRequestDTO model) {
		return query("modelMapper", "selectKidsModelAndSearchAndLimitAndOffset", model);
	}

	@Override
	public List<ModelDTO> findNewFacesAndSearchAndLimitAndOffset(ModelSearchAndLimitRequestDTO model) {
		return query("modelMapper", "selectNewFacesModelAndSearchAndLimitAndOffset", model);
	}
	
	
}
