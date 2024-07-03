/**
 * @author giang
 */
package tp.kits3.comedians.service.impl;

import java.util.List;

import org.ocpsoft.pretty.time.PrettyTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.ICommentCustomDAO;
import tp.kits3.comedians.dao.ICommentDAO;
import tp.kits3.comedians.dao.IStaffDao;
import tp.kits3.comedians.dao.IUserDao;
import tp.kits3.comedians.dto.CommentDTO;
import tp.kits3.comedians.model.CommentModel;
import tp.kits3.comedians.model.StaffModel;
import tp.kits3.comedians.model.UserModel;
import tp.kits3.comedians.service.ICommentService;

@Service
public class CommentService implements ICommentService {

	@Autowired
	private ICommentDAO commentDAO;
	
	@Autowired
	private ICommentCustomDAO commentCustomDAO;
	
	@Autowired
	private IStaffDao staffDAO;
	
	@Autowired
	private IUserDao userDAO;
	
	@Override
	public List<CommentModel> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CommentModel findOneById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(CommentModel commentModel) {
		return commentDAO.insert(commentModel);
	}

	@Override
	public void update(CommentModel param) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int id) {
		commentDAO.delete(id);
	}

	@Override
	public List<CommentDTO> findAllByModelId(int modelid) {
		List<CommentDTO> listDTO = commentCustomDAO.findAllByModelId(modelid);
		for(int i = 0 ; i < listDTO.size() ; ++i) {
			int accountid = listDTO.get(i).getAccountid();
			StaffModel staffModel = staffDAO.findOneByAccountId(accountid);
			if(staffModel != null) {
				listDTO.get(i).setAvatar(staffModel.getAvatar());
			}else {
				UserModel userModel = userDAO.findOneByAccountId(accountid);
				listDTO.get(i).setAvatar(userModel.getAvatar());
			}
			PrettyTime p = new PrettyTime();
			listDTO.get(i).setCommenttime(p.format(listDTO.get(i).getCreatedate()));
		}
		return listDTO;
	}

	@Override
	public List<CommentDTO> findAllByParentId(int parentid) {
		List<CommentDTO> listDTO = commentCustomDAO.findAllByParentId(parentid);
		for(int i = 0 ; i < listDTO.size() ; ++i) {
			int accountid = listDTO.get(i).getAccountid();
			StaffModel staffModel = staffDAO.findOneByAccountId(accountid);
			if(staffModel != null) {
				listDTO.get(i).setAvatar(staffModel.getAvatar());
			}else {
				UserModel userModel = userDAO.findOneByAccountId(accountid);
				listDTO.get(i).setAvatar(userModel.getAvatar());
			}
			PrettyTime p = new PrettyTime();
			listDTO.get(i).setCommenttime(p.format(listDTO.get(i).getCreatedate()));
		}
		return listDTO;
	}

	@Override
	public List<CommentDTO> findAllSubComment(int modelid) {
		List<CommentDTO> listDTO = commentCustomDAO.findAllSubComment(modelid);
		for(int i = 0 ; i < listDTO.size() ; ++i) {
			int accountid = listDTO.get(i).getAccountid();
			StaffModel staffModel = staffDAO.findOneByAccountId(accountid);
			if(staffModel != null) {
				listDTO.get(i).setAvatar(staffModel.getAvatar());
			}else {
				UserModel userModel = userDAO.findOneByAccountId(accountid);
				listDTO.get(i).setAvatar(userModel.getAvatar());
			}
			PrettyTime p = new PrettyTime();
			listDTO.get(i).setCommenttime(p.format(listDTO.get(i).getCreatedate()));
		}
		return listDTO;
	}

	@Override
	public CommentDTO findById(int id) {
		CommentDTO comment = commentCustomDAO.findById(id);
		int accountid = comment.getAccountid();
		StaffModel staffModel = staffDAO.findOneByAccountId(accountid);
		if(staffModel != null) {
			comment.setAvatar(staffModel.getAvatar());
		}else {
			UserModel userModel = userDAO.findOneByAccountId(accountid);
			comment.setAvatar(userModel.getAvatar());
		}
		PrettyTime p = new PrettyTime();
		comment.setCommenttime(p.format(comment.getCreatedate()));
		return comment;
	}

}
