package com.asm.Controller;

import com.asm.Dao.ProductRepo;
import com.asm.Entity.Account;
import com.asm.Entity.Order;
import com.asm.Entity.OrderDetail;
import com.asm.Entity.Product;
import com.asm.Service.MailerService;
import com.asm.Service.OrderService;
import com.asm.Service.ProductService;
import com.asm.Service.ShoppingCartService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
public class ShoppingCartController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private ShoppingCartService cartService;
	@Autowired
	private ProductRepo productRepo;
	@Autowired
	MailerService mailer;

	@GetMapping("/cart")

	public String viewCart(Model model, HttpSession session) {
		List<Map<String, Object>> db = new ArrayList<>();
		List<Product> data = cartService.getCartItems();
		ObjectMapper mapper = new ObjectMapper();
		TypeReference<List<String>> typeString = new TypeReference<List<String>>() {
		};

		double totalAmount = 0;

		try {
			for (Product p : data) {
				Map<String, Object> map = new HashMap<>();
				map.put("product", p);
				map.put("images", mapper.readValue(p.getImages(), typeString));
				totalAmount += p.getPrice() * p.getQuantity();

				db.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("cartItems", db);
		session.setAttribute("totalAmount", totalAmount);
		model.addAttribute("cart", db);
		model.addAttribute("totalAmount", totalAmount);
		return "user/Cart";
	}

	@GetMapping("/add/{id}")
	public String addProductToCart(@PathVariable("id") Long id, Model model) {
		cartService.addProduct(id);
		model.addAttribute("message", "Đã Thêm Vào Giỏ Hàng");
		return "redirect:/Cart";
	}

	@GetMapping("/remove/{id}")
	public String removeProductFromCart(@PathVariable("id") Long id, Model model) {
		cartService.removeProduct(id);
		model.addAttribute("message", "Đã Xóa Sản Phẩm");
		return "redirect:/cart";
	}

	@PostMapping("/update/{id}")
	public String updateProductQuantity(@PathVariable("id") Long id, @RequestParam("qty") Integer qty) {
		cartService.updateProductQuantity(id, qty);
		return "redirect:/cart";
	}

	@GetMapping("/clear")
	public String clearCart() {
		cartService.clearCart();
		return "redirect:/cart";
	}

	@GetMapping("/checkout")
	public String checkout(HttpSession session, Model model) {
		List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cartItems");
		double totalAmount = (double) session.getAttribute("totalAmount");
		model.addAttribute("cart", cart);
		model.addAttribute("totalAmount", totalAmount);
		return "user/CheckOut";
	}

	@PostMapping("/submitOrder")
	public String submitOrder(@RequestParam("fullname") String fullname, @RequestParam("email") String email,
			@RequestParam("address") String address, @RequestParam("note") String note, HttpSession session,
			Model model) throws MessagingException {
		if (session.getAttribute("loggedInUser") != null) {
			List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cartItems");
			double totalAmount = (double) session.getAttribute("totalAmount");
			Account loggedInUser = (Account) session.getAttribute("loggedInUser");
			String username = loggedInUser.getUsername();
			String subject = "Order Confirmation";
			StringBuilder body = new StringBuilder();
			body.append("Dear ").append(fullname).append(",\n\n")
					.append("Thank you for your order. Here are the details:\n\n").append("Full Name: ")
					.append(fullname).append("\n").append("Email: ").append(email).append("\n").append("Address: ")
					.append(address).append("\n").append("Note: ").append(note).append("\n\n")
					.append("Order Details:\n");

			
			body.append("\nTotal Amount: ").append(totalAmount).append("\n\n")
					.append("Thank you for shopping with us.\n").append("Best regards,\n").append("Your Company Name");
			mailer.send(email, subject, body.toString());
			orderService.processOrder(fullname, email, address, note, cart, username);
			cartService.clearCart();
			session.removeAttribute("cartItems");
			session.removeAttribute("totalAmount");
			model.addAttribute("message", "Đăng Nhập Thành Công!");
			return "redirect:/orderConfirmation";
		} else {
			model.addAttribute("message", "Vui lòng Đăng Nhập Để Đặt Hàng.!");
			return "user/Login";
		}

	}

	@GetMapping("/detail{id}")
	public String detail(Model model, Principal principal, @PathVariable("id") Long id, HttpSession session) {
		Order order = orderService.findById(id);
		Account loggedInUser = (Account) session.getAttribute("loggedInUser");
		String username = loggedInUser.getUsername();
		if (!order.getAccount().getUsername().equals(username)) {
			return "redirect:/login?message=Access%20Denied";
		} else {
			model.addAttribute("order", order);
			List<OrderDetail> orderDetail = order.getOrderDetails();
			Double total = (double) 0;
			for (OrderDetail od : orderDetail) {
				total += od.getPrice() * od.getQuantity();
			}
			model.addAttribute("total", total);
			return "user/detail";

		}
	}

	@GetMapping("/chitietsanpham{id}")
	public String getProductDetail(@PathVariable Long id, Model model) {
		Optional<Product> productOpt = productRepo.findById(id);
		List<Map<String, Object>> db = new ArrayList<>();

		ObjectMapper mapper = new ObjectMapper();
		TypeReference<List<String>> typeString = new TypeReference<List<String>>() {
		};

		Product product = productOpt.get();
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("product", product);
			map.put("images", mapper.readValue(product.getImages(), typeString));
			db.add(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("product", db);
		return "user/product-detail";

	}

}
