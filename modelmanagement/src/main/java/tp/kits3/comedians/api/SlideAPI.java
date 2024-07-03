package tp.kits3.comedians.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import tp.kits3.comedians.dto.CommonDTO;
import tp.kits3.comedians.model.SlideModel;
import tp.kits3.comedians.service.ISlideService;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/api-admin/slide")
public class SlideAPI {
	
	@Autowired
	private ISlideService slideService;
	
	@PostMapping("/delete")
	public Object deleteSlide(@RequestBody CommonDTO ids) {
		String status = "";
		try {
		slideService.delete(ids.getIds());
			status = "OK";
			return new ResponseEntity<String>(status, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e);
			status = "ERROR";
			return new ResponseEntity<String>(status, HttpStatus.BAD_GATEWAY);
		}
	}
	
	@PostMapping("/search")
	public ResponseEntity<List<SlideModel>> search(@RequestBody SlideModel slideModel){
		slideModel.setImg("%" + slideModel.getImg() + "%");
		try {
			List<SlideModel> list = slideService.findAllByImg(slideModel.getImg());
			return new ResponseEntity<List<SlideModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<SlideModel>>(HttpStatus.BAD_GATEWAY);
		}
	}

}
