/**
 * @author loi
 */
package tp.kits3.comedians.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.ISlideDao;
import tp.kits3.comedians.model.SlideModel;

@Repository
public class SlideDao extends CommonDao<SlideModel> implements ISlideDao{

	@Override
	public List<SlideModel> findAll() {
		// TODO Auto-generated method stub
		return query("slideMapper", "selectAll");
	}

	@Override
	public SlideModel findById(int id) {
		// TODO Auto-generated method stub
		List<SlideModel> list = query("slideMapper", "selectById", id);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public int insert(SlideModel slide) {
		// TODO Auto-generated method stub
		int result = insert("slideMapper", "insert", slide);
		return result;
	}

	@Override
	public int update(SlideModel slide) {
		// TODO Auto-generated method stub
		int result = update("slideMapper", "update", slide);
		return result;
	}

	@Override
	public void delete(List<Integer> id) {
		// TODO Auto-generated method stub
		delete("slideMapper", "delete", id);
	}

	@Override
	public List<SlideModel> findAllByImg(String img) {
		// TODO Auto-generated method stub
		return query("slideMapper", "selectAllByImg", img);
	}
	
}
