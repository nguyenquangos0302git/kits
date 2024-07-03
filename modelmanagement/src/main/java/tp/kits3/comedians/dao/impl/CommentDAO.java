package tp.kits3.comedians.dao.impl;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.ICommentDAO;
import tp.kits3.comedians.model.CommentModel;

@Repository
public class CommentDAO extends CommonDao<CommentModel> implements ICommentDAO {

	@Override
	public int insert(CommentModel commentModel) {
		insert("commentMapper", "insert", commentModel);
		return commentModel.getId();
	}

	@Override
	public void delete(int id) {
		delete("commentMapper", "delete", id);
		delete("commentMapper", "deletesubcomment", id);
	}

}
