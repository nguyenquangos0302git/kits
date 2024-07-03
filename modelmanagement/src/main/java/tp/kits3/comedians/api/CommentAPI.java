/**
 * @author giang
 */
package tp.kits3.comedians.api;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.dto.CommentDTO;
import tp.kits3.comedians.model.CommentModel;
import tp.kits3.comedians.service.ICommentService;
import tp.kits3.comedians.utils.SessionUtil;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/api-admin/comment")
public class CommentAPI {

	@Autowired
	private ICommentService commentService;
	
	@PostMapping("/add")
	public ResponseEntity<CommentDTO> addComment(@RequestBody CommentModel commentModel, HttpServletRequest req) {
		AccountUserRoleDTO user = (AccountUserRoleDTO) SessionUtil.getInstance().getValue(req, "ACCOUNT");
		commentModel.setCreatedby(user.getUsername());
		commentModel.setModifiedby(user.getUsername());
		int id = commentService.insert(commentModel);
		if(id != 0) {
			CommentDTO comment = commentService.findById(id);
			return new ResponseEntity<CommentDTO>(comment,HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.BAD_GATEWAY);
	}
	
	@PostMapping("/delete")
	public Object deleteComment(@RequestBody CommentModel commentModel) {
		try {
			commentService.delete(commentModel.getId());
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_GATEWAY);
		}
	}
}
