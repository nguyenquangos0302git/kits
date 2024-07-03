package tp.kits3.comedians.servlet;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.payment.PaymentService;
import tp.kits3.comedians.service.IContractService;
import tp.kits3.comedians.utils.SessionUtil;

/**
 * Servlet implementation class ExecutePaymentServlet
 */
//@WebServlet("/execute_payment")
public class ExecutePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Inject
	private IContractService contractService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExecutePaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");
		
		try {
			PaymentService paymentService = new PaymentService();
			Payment payment = paymentService.executePayment(paymentId, payerId);
			
			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			//ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
			
			request.setAttribute("payer", payerInfo);
			request.setAttribute("transaction", transaction);
			AccountUserRoleDTO account = (AccountUserRoleDTO) SessionUtil.getInstance().getValue(request, "ACCOUNT");
			contractService.insert(account.getId(), account.getName());
			//request.setAttribute("shippingAddress", shippingAddress);
			request.getRequestDispatcher("WEB-INF/views/web/receipt.jsp").forward(request, response);
		} catch (PayPalRESTException e) {
			request.setAttribute("errorMessage", "Invalid Payment Details");
			e.printStackTrace();
			request.getRequestDispatcher("WEB-INF/views/web/error.jsp").forward(request, response);
		}
	}

}
