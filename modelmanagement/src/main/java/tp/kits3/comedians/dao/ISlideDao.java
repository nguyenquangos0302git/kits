/**
 * @author loi
 */
package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.model.SlideModel;

public interface ISlideDao extends GenericDao<SlideModel> {
	List<SlideModel> findAll();

	List<SlideModel> findAllByImg(String img);

	SlideModel findById(int id);

	int insert(SlideModel slide);

	int update(SlideModel slide);

	void delete(List<Integer> id);
}
