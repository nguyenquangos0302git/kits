package tp.kits3.comedians.servlet;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.paypal.base.rest.PayPalRESTException;

import tp.kits3.comedians.model.OrderDetail;
import tp.kits3.comedians.payment.PaymentService;

@Controller
public class AuthorizePaymentController {

	@RequestMapping(value = "/authorize_payment", method = RequestMethod.POST)
	public String authorize(HttpServletRequest req) {
		String total = req.getParameter("subtotal");
		System.out.println(req.getParameter("subtotal"));
		OrderDetail orderDetail = new OrderDetail(total);
		
		try {
			PaymentService paymentServices = new PaymentService();
			String approvalLink = paymentServices.authorizePayment(req, orderDetail);

//			response.sendRedirect(approvalLink);
			return "redirect:"+ approvalLink;
			
		} catch (PayPalRESTException ex) {
			req.setAttribute("errorMessage", "Invalid Payment Details");
			ex.printStackTrace();
//			req.getRequestDispatcher("WEB-INF/views/web/error.jsp").forward(request, response);
			return "web/error";
		}
	}
}
