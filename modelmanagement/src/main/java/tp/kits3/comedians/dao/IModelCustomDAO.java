package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.dto.ModelDTO;
import tp.kits3.comedians.dto.ModelSearchAndLimitRequestDTO;

public interface IModelCustomDAO extends GenericDao<ModelDTO>{

	List<ModelDTO> findAllModel();
	
	List<ModelDTO> findAllMaleModel();
	
	List<ModelDTO> findAllFemaleModel();

	List<ModelDTO> findAllNewModel();
	
	List<ModelDTO> findAllKid();
	
	List<ModelDTO> findTopTenModel();
	
	ModelDTO findOneById(int id);
	
	List<ModelDTO> searchShowAllAmin(String name);
	
	List<ModelDTO> findAllModelDTO();

	List<ModelDTO> selectTalent(int modelid);
	
	List<String> multiImage(int modelid);
	
	List<ModelDTO> findAll(int limit, int offset);
	
	List<ModelDTO> findAllMaleModelLimit(int limit, int offset);
	
	List<ModelDTO> findAllFemaleModelLimit(int limit, int offset);

	List<ModelDTO> findAllNewModelLimit(int limit, int offset);
	
	List<ModelDTO> findAllKidLimit(int limit, int offset);
	
	List<ModelDTO> findAllAndSearch(ModelSearchAndLimitRequestDTO model);
	
	List<ModelDTO> findAllAndSearchAndLimitAndOffset(ModelSearchAndLimitRequestDTO model);
	
	List<ModelDTO> findMaleSearchAndLimitAndOffset(ModelSearchAndLimitRequestDTO model);
	
	List<ModelDTO> findFemaleAndSearchAndLimitAndOffset(ModelSearchAndLimitRequestDTO model);
	
	List<ModelDTO> findKidsAndSearchAndLimitAndOffset(ModelSearchAndLimitRequestDTO model);
	
	List<ModelDTO> findNewFacesAndSearchAndLimitAndOffset(ModelSearchAndLimitRequestDTO model);
}
