package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.dto.CommentDTO;

public interface ICommentCustomDAO extends GenericDao<CommentDTO> {

	List<CommentDTO> findAllByModelId(int modelid);
	
	List<CommentDTO> findAllByParentId(int parentid);
	
	List<CommentDTO> findAllSubComment(int modelid);
	
	CommentDTO findById(int id);
}
