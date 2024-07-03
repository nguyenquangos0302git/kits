/**
 * @author dung
 */
package tp.kits3.comedians.service;

import java.util.List;

import tp.kits3.comedians.model.ImagesModel;

public interface IImagesService {
	List<ImagesModel> findAll();
	ImagesModel selectOne(int id);
	void insert(ImagesModel param);
	void update(ImagesModel param);
	void delete(int id);
}
