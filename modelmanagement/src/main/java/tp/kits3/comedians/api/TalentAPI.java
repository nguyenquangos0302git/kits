package tp.kits3.comedians.api;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tp.kits3.comedians.dto.CommonDTO;
import tp.kits3.comedians.model.TalentModel;
import tp.kits3.comedians.service.ITalentService;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/api-admin/talent")
public class TalentAPI {

		@Autowired
		private ITalentService talentService;
		
		@PostMapping("/delete")
		public Object deleteTalent(@RequestBody CommonDTO ids) {
			String status = "ERROR";
			try {
				if(ids.getIds().size()>0) {
					talentService.delete(ids.getIds());
					status = "OK";
					return new ResponseEntity<String>(status, HttpStatus.OK);
				}else {
					return new ResponseEntity<String>(status, HttpStatus.BAD_GATEWAY);
				}
			} catch (Exception e) {
				System.out.println(e);
				return new ResponseEntity<String>(status, HttpStatus.BAD_GATEWAY);
			}
		}
		
		@PostMapping("/search")
		public ResponseEntity<List<TalentModel>> search(@RequestBody TalentModel talentModel){
			talentModel.setName("%" + talentModel.getName() + "%");
			try {
				List<TalentModel> list = talentService.findAllByName(talentModel.getName());
				return new ResponseEntity<List<TalentModel>>(list, HttpStatus.OK);
			} catch (Exception e) {
				return new ResponseEntity<List<TalentModel>>(HttpStatus.BAD_GATEWAY);
			}
		}
}
