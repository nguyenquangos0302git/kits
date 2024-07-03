package tp.kits3.comedians.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import tp.kits3.comedians.model.ReportModel;
import tp.kits3.comedians.service.IReportService;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class ReportAPI {

	@Autowired
	private IReportService reportService;
	
	@GetMapping("/api-admin/report/findall")
	public Object getAllReport() {
		try {
			List<ReportModel> reportList = reportService.findAll();
			return new ResponseEntity<List<ReportModel>>(reportList, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_GATEWAY);
		}
	}
	
}
