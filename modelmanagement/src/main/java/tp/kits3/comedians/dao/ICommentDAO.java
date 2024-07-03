package tp.kits3.comedians.dao;

import tp.kits3.comedians.model.CommentModel;

public interface ICommentDAO extends GenericDao<CommentModel> {
	
	int insert(CommentModel commentModel);

	void delete(int id);
}
