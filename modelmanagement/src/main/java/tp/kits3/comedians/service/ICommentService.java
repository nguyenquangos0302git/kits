/**
 * @author dung
 */
package tp.kits3.comedians.service;

import java.util.List;

import tp.kits3.comedians.dto.CommentDTO;
import tp.kits3.comedians.model.CommentModel;

public interface ICommentService {
	List<CommentModel> findAll();

	CommentModel findOneById(int id);
	
	List<CommentDTO> findAllByModelId(int modelid);
	
	List<CommentDTO> findAllByParentId(int parentid);
	
	List<CommentDTO> findAllSubComment(int modelid);
	
	CommentDTO findById(int id);

	int insert(CommentModel commentModel);

	void update(CommentModel param);

	void delete(int id);
}
