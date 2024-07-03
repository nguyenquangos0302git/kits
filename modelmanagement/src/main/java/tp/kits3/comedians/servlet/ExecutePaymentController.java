package tp.kits3.comedians.servlet;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.payment.PaymentService;
import tp.kits3.comedians.service.IContractService;
import tp.kits3.comedians.utils.SessionUtil;

@Controller
public class ExecutePaymentController {
	
	@Autowired
	private IContractService contractService;

	@RequestMapping(value = "/execute_payment", method = RequestMethod.POST)
	public String execute(HttpServletRequest req) {
		String paymentId = req.getParameter("paymentId");
		String payerId = req.getParameter("PayerID");
		
		try {
			PaymentService paymentService = new PaymentService();
			Payment payment = paymentService.executePayment(paymentId, payerId);
			
			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			//ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
			
			req.setAttribute("payer", payerInfo);
			req.setAttribute("transaction", transaction);
			AccountUserRoleDTO account = (AccountUserRoleDTO) SessionUtil.getInstance().getValue(req, "ACCOUNT");
			contractService.insert(account.getId(), account.getName());
			//request.setAttribute("shippingAddress", shippingAddress);
//			request.getRequestDispatcher("WEB-INF/views/web/receipt.jsp").forward(request, response);
			return "web/receipt";
		} catch (PayPalRESTException e) {
			req.setAttribute("errorMessage", "Invalid Payment Details");
			e.printStackTrace();
//			request.getRequestDispatcher("WEB-INF/views/web/error.jsp").forward(request, response);
			return "web/error";
		}
	}
}
