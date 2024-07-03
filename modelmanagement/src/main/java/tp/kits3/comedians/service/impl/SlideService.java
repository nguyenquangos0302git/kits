/**
 * @author dung, loi
 */
package tp.kits3.comedians.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.ISlideDao;
import tp.kits3.comedians.model.SlideModel;
import tp.kits3.comedians.service.ISlideService;

@Service
public class SlideService implements ISlideService {
	
	@Autowired
	private ISlideDao slideDao;
	@Override
	public List<SlideModel> findAll() {
		// TODO Auto-generated method stub
		List<SlideModel> list = slideDao.findAll();
		return list;
	}

	@Override
	public SlideModel selectOne(int id) {
		// TODO Auto-generated method stub
		return slideDao.findById(id);
	}

	@Override
	public int insert(SlideModel param) {
		// TODO Auto-generated method stub
		return slideDao.insert(param);
	}

	@Override
	public int update(SlideModel param) {
		// TODO Auto-generated method stub
		int result = slideDao.update(param);
		return result;
	}

	@Override
	public void delete(List<Integer> id) {
		// TODO Auto-generated method stub
		slideDao.delete(id);
	}

	@Override
	public List<SlideModel> findAllByImg(String img) {
		// TODO Auto-generated method stub
		return slideDao.findAllByImg(img);
	}

}
