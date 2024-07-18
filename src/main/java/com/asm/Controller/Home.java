package com.asm.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.asm.Dao.AccountRepo;
import com.asm.Dao.OrderRepo;
import com.asm.Dao.ProductRepo;
import com.asm.Dao.RoleDetailRepo;
import com.asm.Entity.Account;
import com.asm.Entity.Order;
import com.asm.Entity.OrderDetail;
import com.asm.Entity.Product;
import com.asm.Entity.ProductCategory;
import com.asm.Entity.Role;
import com.asm.Entity.RoleDetail;
import com.asm.Service.BrandService;
import com.asm.Service.CategoryService;
import com.asm.Service.CodeGenerator;
import com.asm.Service.MailerService;
import com.asm.Service.ProductService;
import com.asm.Service.SessionService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class Home {
	@Autowired
	ProductRepo pRepo;

	@Autowired
	MailerService mailer;

	@Autowired
	OrderRepo ORepo;
	@Autowired
	RoleDetailRepo rdRepo;

	@Autowired
	private SessionService sessionS;
	@Autowired
	ProductService pService;
	@Autowired
	BrandService bService;
	@Autowired
	CategoryService cService;
	@Autowired
	SessionService session1;
	@Autowired
	AccountRepo aRepo;

	@RequestMapping("/")
	public String index(Model model) {
		Sort sort = Sort.by(Direction.DESC, "createDate");
		List<Product> data = pRepo.findAll(sort);
		TypeReference<List<String>> typeString = new TypeReference<List<String>>() {
		};
		ObjectMapper mapper = new ObjectMapper();
		List<String> images = new ArrayList<String>();
		List<Map<String, Object>> db = new ArrayList<Map<String, Object>>();
		try {

			for (Product p : data) {
				Map<String, Object> map = new HashMap<String, Object>();
				p.getId();
				p.getName();
				p.getPrice();
				images = mapper.readValue(p.getImages(), typeString);
				map.put("product", p);
				map.put("images", images);
				db.add(map);
			}
		} catch (Exception e) {
		}
		model.addAttribute("items", db);

		return "user/home";
	}

	@RequestMapping("/list")
	public String listSP(Model model, @RequestParam("page") Optional<Integer> page) {
		Pageable pageable = PageRequest.of(page.orElse(0), 9);
		Page<Product> data = pRepo.findAll(pageable);
		TypeReference<List<String>> typeString = new TypeReference<List<String>>() {
		};
		ObjectMapper mapper = new ObjectMapper();
		List<Map<String, Object>> db = new ArrayList<>();

		try {
			for (Product p : data) {
				Map<String, Object> map = new HashMap<>();
				map.put("product", p);
				map.put("images", mapper.readValue(p.getImages(), typeString));
				db.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("currentPage", data.getNumber());
		model.addAttribute("totalPages", data.getTotalPages());
		model.addAttribute("page", db);

		return "user/SP";
	}

	@RequestMapping("/logout")
	public String logoutSuccess(Model model, HttpSession session) {
		session.removeAttribute("loggedInUser");
		session.removeAttribute("userAdmin");
		session.removeAttribute("security-uri");
		session.removeAttribute("uri");
		model.addAttribute("message", "Đăng xuất thành công");
		return "user/Login";
	}

	@PostMapping("/login")
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession session, Model model, @RequestParam("p") Optional<Integer> p) {
		try {
			Account user = aRepo.getOne(username);
			if (!user.getPassword().equals(password)) {
				model.addAttribute("message", "Invalid password");
			} else {
				session.setAttribute("loggedInUser", user);

				String uri = (String) session.getAttribute("security-uri");
				if (user.getActivated() == true) {
					boolean isAdmin = checkAdmin(user);
					if (isAdmin) {
						session.setAttribute("userAdmin", user);
						model.addAttribute("message", "Login succeed as admin");
//						String kwords = "";
//						session1.set("keywords", kwords);
//						Pageable pageable = PageRequest.of(p.orElse(0), 9);
//						Page<Product> page = pService.searchProductByKY(kwords, pageable);
//						TypeReference<List<String>> typeString = new TypeReference<List<String>>() {
//						};
//						ObjectMapper mapper = new ObjectMapper();
//						List<Map<String, Object>> db = new ArrayList<>();
//
//						try {
//							for (Product pr : page) {
//								Map<String, Object> map = new HashMap<>();
//								map.put("product", pr);
//								map.put("images", mapper.readValue(pr.getImages(), typeString));
//								db.add(map);
//							}
//						} catch (Exception e) {
//							e.printStackTrace();
//						}
//						model.addAttribute("currentPage", page.getNumber());
//						model.addAttribute("totalPages", page.getTotalPages());
//						model.addAttribute("page", db);
//						model.addAttribute("keywords", kwords);
						return "admin/Product";
					} else {
						model.addAttribute("message", "Login succeed");
						return "user/user";
					}
				} else {
					model.addAttribute("message", "Tài Khoản đã bị khóa");
					return "user/Login";
				}
			}
		} catch (Exception e) {
			model.addAttribute("message", "Invalid username");
		}

		return "user/Login";
	}

	@GetMapping("/login")
	public String login(Model model, HttpSession session, @RequestParam("p") Optional<Integer> p) {
		if (session.getAttribute("loggedInUser") != null) {
			if (session.getAttribute("userAdmin") != null) {
				String kwords = "";
				session1.set("keywords", kwords);
				Pageable pageable = PageRequest.of(p.orElse(0), 1000);
				Page<Product> page = pService.searchProductByKY(kwords, pageable);
				TypeReference<List<String>> typeString = new TypeReference<List<String>>() {
				};
				ObjectMapper mapper = new ObjectMapper();
				List<Map<String, Object>> db = new ArrayList<>();

				try {
					for (Product pr : page) {
						Map<String, Object> map = new HashMap<>();
						map.put("product", pr);
						map.put("images", mapper.readValue(pr.getImages(), typeString));
						db.add(map);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				model.addAttribute("currentPage", page.getNumber());
				model.addAttribute("totalPages", page.getTotalPages());
				model.addAttribute("page", db);
				model.addAttribute("keywords", kwords);
				return "admin/Product";
			} else {
				return "user/user";
			}
		} else {
			return "user/Login";
		}
	}

	public boolean checkAdmin(Account user) {
		for (RoleDetail roleDetail : user.getRoleDetails()) {
			String roleName = roleDetail.getRole().getRole();
			if ("staff".equals(roleName) || "director".equals(roleName)) {
				return true;
			}
		}
		return false;
	}

	@RequestMapping("/listOdert")
	public String listOrder(Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("loggedInUser");
		List<Order> orders = ORepo.findByUsername(account.getUsername());

		List<Map<String, Object>> db = new ArrayList<Map<String, Object>>();
		for (Order order : orders) {
			Map<String, Object> map = new HashMap<String, Object>();
			List<OrderDetail> orderDetail = order.getOrderDetails();
			Double total = (double) 0;
			for (OrderDetail od : orderDetail) {
				total += od.getPrice() * od.getQuantity();
			}
			map.put("order", order);
			map.put("total", total);
			db.add(map);
		}
		model.addAttribute("orders", db);
		return "user/ListOder";
	}

	@GetMapping("/SignUp")
	public String register(@ModelAttribute Account account) {
		return "user/Signup";
	}

	@PostMapping("/SignUp")
	public String signup(Model model, @ModelAttribute Account account) {
		if (aRepo.existsById(account.getUsername())) {
			model.addAttribute("message", "Đã tồn tại username " + account.getUsername());
			return "user/Signup";
		} else {
			account.setActivated(true);

			account.setPhoto("logo.jpg");

			Role r = new Role();
			r.setRole("user");
			RoleDetail rd = new RoleDetail();
			rd.setAccount(account);
			rd.setRole(r);

			aRepo.save(account);
			rdRepo.save(rd);
			model.addAttribute("message", "Đăng Ký Thành Công!");

			return "user/Login";
		}
	}

	@GetMapping("/forgot-password")
	public String forgot() {
		return "user/QuenPass";
	}

	@PostMapping("/Guicode")
	public String sendCode(@RequestParam("username") String username, HttpSession session,
			RedirectAttributes redirectAttributes, Model model) throws MessagingException {
		String code = CodeGenerator.generateCode(6);
		try {
			Account user = aRepo.getOne(username);
			if (user != null) {
				mailer.send(user.getEmail(), "Your Verification Code", "Your verification code is: " + code);
				session.setAttribute("userdoipass", user.getUsername());
				session.setAttribute("verificationCode", code);
				model.addAttribute("message", "Đã Gửi Mã Xác Nhận!");
				return "user/XacnhanCode";

			} else {
				model.addAttribute("message", "Tài khoảng Không tồn tại!");
				return "user/QuenPass";
			}
		} catch (Exception e) {
			model.addAttribute("message", "Tài khoảng Không tồn tại!");
			return "user/QuenPass";
		}

	}

	@PostMapping("/DoiPass")
	public String changePassword(@RequestParam("code") String code, @RequestParam("password") String password,
			HttpSession session, RedirectAttributes redirectAttributes) {
		String storedCode = (String) session.getAttribute("verificationCode");
		String username = (String) session.getAttribute("userdoipass");

		if (storedCode != null && storedCode.equals(code)) {
			Account user = aRepo.getOne(username);
			user.setPassword(password);
			aRepo.save(user);
			redirectAttributes.addFlashAttribute("message", "Đổi mật khẩu thành công.");
			return "redirect:/login";
		} else {
			redirectAttributes.addFlashAttribute("error", "Code không đúng.");
			return "user/QuenPass";
		}
	}

}
