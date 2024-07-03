package tp.kits3.comedians.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import tp.kits3.comedians.model.ModelModel;
import tp.kits3.comedians.service.IModelService;
import tp.kits3.comedians.service.IRatingService;

@Configuration
@EnableScheduling
public class UpdateRatingModel {
	
	@Autowired
	IModelService modelService;
	
	@Autowired
	IRatingService ratingService;
	
	@Scheduled(cron = "* * * * * ?")
	public void autoUpdateRatingModel() {
		List<Integer> listModelid = ratingService.findAllModelid();
		for(int i : listModelid) {
			ModelModel model = modelService.findById(i);
			model.setRating(ratingService.avgStarModel(i));
			modelService.update(model);
		}
	}
}
