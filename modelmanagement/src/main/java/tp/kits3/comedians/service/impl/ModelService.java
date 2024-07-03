/**
 * @author dung
 */
package tp.kits3.comedians.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.IModelCustomDAO;
import tp.kits3.comedians.dao.IModelDao;
import tp.kits3.comedians.dto.ModelDTO;
import tp.kits3.comedians.dto.ModelSearchAndLimitRequestDTO;
import tp.kits3.comedians.model.ModelModel;
import tp.kits3.comedians.service.IModelService;
import tp.kits3.comedians.utils.AgePerson;

@Service
public class ModelService implements IModelService {

	@Autowired
	private IModelDao modelDao;
	
	@Autowired
	private IModelCustomDAO modelCustomDAO;

	@Override
	public List<ModelModel> findAll() {
		List<ModelModel> list = modelDao.findAll();
		return list;
	}

	@Override
	public ModelModel findById(int id) {
		return modelDao.findOneById(id);
	}

	@Override
	public int insert(ModelModel model) {
		int result = modelDao.insert(model);
		return result;
		// TODO Auto-generated method stub

	}

	@Override
	public int update(ModelModel model) {
		int result = modelDao.update(model);
		return result;
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(List<Integer> ids) {
		modelDao.delete(ids);
		// TODO Auto-generated method stub

	}

	@Override
	public List<ModelDTO> findMales() {
		return modelCustomDAO.findAllMaleModel();
	}

	@Override
	public List<ModelDTO> findFemales() {
		return modelCustomDAO.findAllFemaleModel();
	}

	@Override
	public List<ModelDTO> findNewFace() {
		return modelCustomDAO.findAllNewModel();
	}

	@Override
	public ModelDTO findModelById(int id) {
		ModelDTO model = modelCustomDAO.findOneById(id);
		model.setAge(AgePerson.ages(model.getBirthday()));
		model.setGender(model.getGender().equals("1") ? "Female" : "Male");
		return model;
	}

	@Override
	public List<ModelDTO> findTopTenModel() {
		return modelCustomDAO.findTopTenModel();
	}

	@Override
	public List<ModelModel> findAllByName(String name) {
		// TODO Auto-generated method stub
		return modelDao.findAllByName(name);
	}

	@Override
	public List<ModelDTO> searchShowAllAdmin(String name) {
		// TODO Auto-generated method stub
		List<ModelDTO> list = modelCustomDAO.searchShowAllAmin(name);
		for(int i =0; i<list.size(); i++) {
			list.get(i).setGender(list.get(i).getGender().equals("1")? "Female": "Male");
		}
		return list;
	}

	@Override
	public List<Integer> selectAge() {
		
		List<Integer> list = modelDao.selectAge();
		
		return list;
	}

	@Override
	public List<ModelDTO> findAllModelDTO() {
		// TODO Auto-generated method stub
		return modelCustomDAO.findAllModelDTO();
	}
	
	public List<ModelDTO> findAllModel() {
		return modelCustomDAO.findAllModel();
	}

	@Override
	public List<ModelDTO> selectTalent(int modelid) {
		return modelCustomDAO.selectTalent(modelid);
	}

	@Override
	public List<String> multiImage(int modelid) {
		
		return modelCustomDAO.multiImage(modelid);
	}

	@Override
	public List<ModelDTO> findKids() {
		return modelCustomDAO.findAllKid();
	}

	@Override
	public List<ModelDTO> findAllModel(int limit, int offset) {
		return modelCustomDAO.findAll(limit, offset);
	}

	@Override
	public List<ModelDTO> findMales(int limit, int offset) {
		// TODO Auto-generated method stub
		return modelCustomDAO.findAllMaleModelLimit(limit, offset);
	}

	@Override
	public List<ModelDTO> findFemales(int limit, int offset) {
		// TODO Auto-generated method stub
		return modelCustomDAO.findAllFemaleModelLimit(limit, offset);
	}

	@Override
	public List<ModelDTO> findNewFace(int limit, int offset) {
		// TODO Auto-generated method stub
		return modelCustomDAO.findAllNewModelLimit(limit, offset);
	}

	@Override
	public List<ModelDTO> findKids(int limit, int offset) {
		// TODO Auto-generated method stub
		return modelCustomDAO.findAllKidLimit(limit, offset);
	}

	@Override
	public List<ModelDTO> findAllModelAndLimit(ModelSearchAndLimitRequestDTO model) {
//		List rank = new ArrayList<>();
//		List talent = new ArrayList<>();
//		for(int m : model.getRank()) {
//			rank.add(m);
//		}
//		for (int m: model.getTalent()) {
//			talent.add(m);
//		}
//		Map map = new HashMap();
//		map.put("rank", rank);
//		map.put("talent", talent);
//		map.put("name", model.getName());
//		map.put("age", model.getAge());
//		map.put("limit", model.getLimit());
		String name = "%" + model.getName() + "%";
		model.setName(name);
		if(model.getTalent().size() > 0) {			
			model.setTalentsize(model.getTalent().size()-1);
		}else {
			model.getTalent().add(1);
			model.getTalent().add(2);
			model.getTalent().add(3);
			model.getTalent().add(4);
			model.getTalent().add(5);
			model.setTalentsize(0);
		}
		if(model.getType() == null) {			
			return modelCustomDAO.findAllAndSearchAndLimitAndOffset(model);
		}
		switch (model.getType()) {
		case "male":
			return modelCustomDAO.findMaleSearchAndLimitAndOffset(model);
		case "female":
			return modelCustomDAO.findFemaleAndSearchAndLimitAndOffset(model);
		case "kids":
			return modelCustomDAO.findKidsAndSearchAndLimitAndOffset(model);
		case "new-faces":
			return modelCustomDAO.findNewFacesAndSearchAndLimitAndOffset(model);
		default: 
			return modelCustomDAO.findAllAndSearchAndLimitAndOffset(model);
		}
		
	}

	@Override
	public List<ModelDTO> findAllModelNotLimit(ModelSearchAndLimitRequestDTO model) {
		String name = "%" + model.getName() + "%";
		model.setName(name);
		model.getTalent().add(1);
		model.getTalent().add(2);
		model.getTalent().add(3);
		model.getTalent().add(4);
		model.getTalent().add(5);
		return modelCustomDAO.findAllAndSearch(model);
	}

}
