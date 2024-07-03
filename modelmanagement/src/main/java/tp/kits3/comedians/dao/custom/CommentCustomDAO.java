/**
 * @author giang
 */
package tp.kits3.comedians.dao.custom;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.ICommentCustomDAO;
import tp.kits3.comedians.dao.impl.CommonDao;
import tp.kits3.comedians.dto.CommentDTO;

@Repository
public class CommentCustomDAO extends CommonDao<CommentDTO> implements ICommentCustomDAO{

	@Override
	public List<CommentDTO> findAllByModelId(int modelid) {
		return query("commentMapper", "selectCommentByModelId", modelid);
	}

	@Override
	public List<CommentDTO> findAllByParentId(int parentid) {
		return query("commentMapper", "selectSubCommentById", parentid);
	}

	@Override
	public List<CommentDTO> findAllSubComment(int modelid) {
		return query("commentMapper", "selectSubComment", modelid);
	}

	@Override
	public CommentDTO findById(int id) {
		List<CommentDTO> list = query("commentMapper", "selectById", id);
		return list.isEmpty() ? null : list.get(0);
	}

}
