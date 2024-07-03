package tp.kits3.comedians.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

import tp.kits3.comedians.service.IRatingService;

@Controller
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class RatingAPI {
	@Autowired
	private IRatingService ratingService;}
