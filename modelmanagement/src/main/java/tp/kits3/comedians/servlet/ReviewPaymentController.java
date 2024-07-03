package tp.kits3.comedians.servlet;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import tp.kits3.comedians.payment.PaymentService;

@Controller
public class ReviewPaymentController {

	@RequestMapping(value = "/review_payment", method = RequestMethod.GET)
	public ModelAndView review(HttpServletRequest req, ModelAndView model) {
		String paymentId = req.getParameter("paymentId");
		String payerId = req.getParameter("PayerID");
		try {
			PaymentService paymentService = new PaymentService();
			Payment payment = paymentService.getPaymentDetails(paymentId);
			
			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			//ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
			
			req.setAttribute("payer", payerInfo);
			req.setAttribute("transaction", transaction);
			//request.setAttribute("shippingAddress", shippingAddress);
			
//			String url = "WEB-INF/views/web/review.jsp?paymentId=" + paymentId + "&PayerID=" + payerId;
//			request.getRequestDispatcher(url).forward(request, response);
			model.setViewName("web/review");
			model.addObject("paymentId", paymentId);
			model.addObject("PayerID", payerId);
			return model;
		} catch (PayPalRESTException ex) {
			req.setAttribute("errorMessage", "Invalid Payment Details");
			ex.printStackTrace();
//			request.getRequestDispatcher("WEB-INF/views/web/error.jsp").forward(request, response);
			model.setViewName("web/error");
			return model;
		}
	}
}
