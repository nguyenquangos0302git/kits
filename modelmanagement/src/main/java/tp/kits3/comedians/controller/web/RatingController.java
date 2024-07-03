/**
 * @author sang
 */
package tp.kits3.comedians.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tp.kits3.comedians.model.RatingModel;
import tp.kits3.comedians.service.IRatingService;

@Controller 
public class RatingController {
	@Autowired
  private IRatingService iRatingService;
  @RequestMapping(value="/model-detail/rating", method = RequestMethod.POST)
  public String insertFrom(Model model) {
	  System.out.println("adsadasdasdasad");
	  return "web/modeldetail";
  }
  @RequestMapping(value="/model-detail/rating/insert", method = RequestMethod.POST)
  public String insert(RatingModel rating) {
	  iRatingService.insert(rating);
	  return "redirect:/model-detail/"+rating.getModelid();
  }
}
