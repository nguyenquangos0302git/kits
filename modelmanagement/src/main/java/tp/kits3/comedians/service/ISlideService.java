/**
 * @author dung, loi
 */
package tp.kits3.comedians.service;

import java.util.List;

import tp.kits3.comedians.model.SlideModel;
import tp.kits3.comedians.model.TalentModel;

public interface ISlideService {
	List<SlideModel> findAll();
	List<SlideModel> findAllByImg(String img);
	SlideModel selectOne(int id);
	int insert(SlideModel param);
	int update(SlideModel param);
	void delete(List<Integer> id);
}
