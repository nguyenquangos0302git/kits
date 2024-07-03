package tp.kits3.comedians.payment;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import tp.kits3.comedians.dto.AccountUserRoleDTO;
import tp.kits3.comedians.model.OrderDetail;
import tp.kits3.comedians.utils.SessionUtil;

@Service
public class PaymentService {

	private static final String CLIENT_ID = "sercet";
	
	private static final String CLIENT_SECERT = "sercet";
	
	private static final String MODE = "sandbox";
	
	public String authorizePayment(HttpServletRequest request, OrderDetail orderDetail) throws PayPalRESTException {
		Payer payer = getPayerInformation(request);
		RedirectUrls redirectUrls = getRedirectURLs();
		List<Transaction> listTransactions = getTransactionInformation(orderDetail); 
		
		Payment requestPayment = new Payment();
		requestPayment.setTransactions(listTransactions)
					  .setRedirectUrls(redirectUrls)
					  .setPayer(payer)
					  .setIntent("authorize");
		
		APIContext apiContext =  new APIContext(CLIENT_ID, CLIENT_SECERT, MODE);
		Payment approvedPayment = requestPayment.create(apiContext);
		
		System.out.println(approvedPayment);
		
		return getApprovalLink(approvedPayment);
	}
	
	private String getApprovalLink(Payment approvedPayment) {
		List<Links> links = approvedPayment.getLinks();
		String approvedLink = null;
		
		for (Links link : links) {
			if (link.getRel().equalsIgnoreCase("approval_url")) {
				approvedLink = link.getHref();
			}
		}
		
		return approvedLink;
	}

	private List<Transaction> getTransactionInformation(OrderDetail orderDetail) {
//		Details details = new Details();
//		details.setShipping("so 1");
//		details.setSubtotal("so 1");
//		details.setTax("1");
		
//		details.setShipping("so 1");
//		details.setSubtotal("2");
//		details.setTax("1");
		
		Amount amount = new Amount();
		amount.setCurrency("USD");
		amount.setTotal(orderDetail.getTotal());
		//amount.setDetails(details);
		
		Transaction transaction = new Transaction();
		transaction.setAmount(amount);
		//transaction.setDescription("product name");
		
		ItemList itemList = new ItemList();
		List<Item> items = new ArrayList<Item>();
		
		Item item = new Item();
		item.setCurrency("USD");
//			.setName("so 1")
//			.setPrice("2")
//			.setTax("1")
//			.setQuantity("1");
		
		items.add(item);
		itemList.setItems(items);
		
		List<Transaction> listTransactions = new ArrayList<Transaction>();
		listTransactions.add(transaction);
		
		return listTransactions;
	}
	
	public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECERT, MODE);
		return Payment.get(apiContext, paymentId);
	}
	
	public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException {
		PaymentExecution paymentExecution = new PaymentExecution();
		paymentExecution.setPayerId(payerId);
		
		Payment payment = new Payment().setId(paymentId);
		
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECERT, MODE);
		
		return payment.execute(apiContext, paymentExecution);
	}
	
	private RedirectUrls getRedirectURLs() {
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl("http://localhost:8080/model/cancel");
		redirectUrls.setReturnUrl("http://localhost:8080/model/review_payment");
		return redirectUrls;
	}

	private Payer getPayerInformation(HttpServletRequest request) {
		AccountUserRoleDTO user = (AccountUserRoleDTO) SessionUtil.getInstance().getValue(request, "ACCOUNT");
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");
		
		PayerInfo payerInfo = new PayerInfo();
		payerInfo.setFirstName(user.getUsername());
		payerInfo.setLastName(user.getName());
		payerInfo.setEmail(user.getEmail());
		
		payer.setPayerInfo(payerInfo);
		
		return payer;
	}
	
}
