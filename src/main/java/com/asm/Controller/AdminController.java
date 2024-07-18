package com.asm.Controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.asm.Dao.ProductRepo;
import com.asm.Entity.Product;
import com.asm.Entity.ProductCategory;
import com.asm.Service.BrandService;
import com.asm.Service.CategoryService;
import com.asm.Service.ProductService;
import com.asm.Service.SessionService;
import com.asm.Service.UploadService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@RequestMapping("/admin")
@Controller

public class AdminController {
	@Autowired
	ProductService pService;
	@Autowired
	BrandService bService;
	@Autowired
	CategoryService cService;
	@Autowired
	SessionService session;
	@Autowired
	private ProductRepo productRepo;

	@Autowired
	UploadService uService;

	@RequestMapping("/TiemKiem")
	public String searchAndPage(Model model, @RequestParam("keywords") Optional<String> kw,
			@RequestParam("p") Optional<Integer> p) {
		String kwords = kw.orElse(session.get("keywords"));
		session.set("keywords", kwords);
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
	}

	@RequestMapping("/product/search")
	public String search(Model model, @RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max, @RequestParam("p") Optional<Integer> p) {
		double minPrice = min.orElse(Double.MIN_VALUE);
		double maxPrice = max.orElse(Double.MAX_VALUE);
		Pageable pageable = PageRequest.of(p.orElse(0), 1000);
		Page<Product> items = pService.findProductBetweenPrices(minPrice, maxPrice, pageable);
		TypeReference<List<String>> typeString = new TypeReference<List<String>>() {
		};
		ObjectMapper mapper = new ObjectMapper();
		List<Map<String, Object>> db = new ArrayList<>();

		try {
			for (Product pr : items) {
				Map<String, Object> map = new HashMap<>();
				map.put("product", pr);
				map.put("images", mapper.readValue(pr.getImages(), typeString));
				db.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("currentPage", items.getNumber());
		model.addAttribute("totalPages", items.getTotalPages());
		model.addAttribute("page", db);
		return "admin/Product";
	}

	@GetMapping("/product/delete/{id}")
	public String DeleteitemName(@PathVariable("id") Long id, Model model) {
		Product product = pService.findById(id);
		pService.deleteById(id);
		return "admin/";
	}

	@GetMapping("/product/update/{id}")
	public String editItem(@PathVariable("id") Long id, Model model) {
		Optional<Product> productOpt = productRepo.findById(id);
		List<Map<String, Object>> db = new ArrayList<>();

		ObjectMapper mapper = new ObjectMapper();
		TypeReference<List<String>> typeString = new TypeReference<List<String>>() {
		};

		if (productOpt.isPresent()) {
			Product product = productOpt.get();
			try {
				Map<String, Object> map = new HashMap<>();
				map.put("product", product);
				map.put("images", mapper.readValue(product.getImages(), typeString));
				db.add(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			return "admin/Product";
		}
		model.addAttribute("productDetails", db.get(0));
		return "admin/edititem";
	}

	@PostMapping("/product/update/{id}")
	public String updateProduct(@RequestParam("id") Long id, @RequestParam("name") String name,
			@RequestParam("price") Double price, @RequestParam("images") MultipartFile[] images, Model model) {
		Optional<Product> productOpt = productRepo.findById(id);
		if (productOpt.isPresent()) {
			Product product = productOpt.get();
			product.setName(name);
			product.setPrice(price);

			if (images != null && images.length > 0) {
				ObjectMapper mapper = new ObjectMapper();
				List<String> imageNames = new ArrayList<>();
				for (MultipartFile image : images) {
					if (!image.isEmpty()) {
						String imageName = saveImage(image);
						if (imageName != null) {
							imageNames.add(imageName);
						}
					}
				}
				try {
					product.setImages(mapper.writeValueAsString(imageNames));
				} catch (JsonProcessingException e) {
					e.printStackTrace();
					model.addAttribute("message", "Error processing images.");
					return "redirect:/admin/edititem";
				}
			}

			productRepo.save(product);
			Optional<Product> productOpt1 = productRepo.findById(id);
			List<Map<String, Object>> db = new ArrayList<>();

			ObjectMapper mapper = new ObjectMapper();
			TypeReference<List<String>> typeString = new TypeReference<List<String>>() {
			};

			if (productOpt.isPresent()) {
				Product product1 = productOpt1.get();
				try {
					Map<String, Object> map = new HashMap<>();
					map.put("product", product1);
					map.put("images", mapper.readValue(product1.getImages(), typeString));
					db.add(map);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				return "admin/Product";
			}
			model.addAttribute("productDetails", db.get(0));
			model.addAttribute("message", "Product updated successfully!");
		} else {
			model.addAttribute("message", "Product not found!");
		}
		return "admin/edititem";
	}

	private String saveImage(MultipartFile image) {
		String imageName = image.getOriginalFilename();
		try {
			Path path = Paths.get("/images/product/" + imageName);
			if (Files.notExists(path)) {
				Files.createDirectories(path.getParent());
			}
			image.transferTo(path);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		return imageName;
	}
	
	@GetMapping("/product/add")
	public String addItem(Model model) {
	    return "admin/add";
	}

	@PostMapping("/product/add")
	public String addProduct(@RequestParam("name") String name,
	                         @RequestParam("price") Double price,
	                         @RequestParam("images") MultipartFile[] images,
	                         Model model) {
	    Product product = new Product();
	    product.setName(name);
	    product.setPrice(price);

	    if (images != null && images.length > 0) {
	        ObjectMapper mapper = new ObjectMapper();
	        List<String> imageNames = new ArrayList<>();
	        for (MultipartFile image : images) {
	            if (!image.isEmpty()) {
	                String imageName = saveImage(image);
	                if (imageName != null) {
	                    imageNames.add(imageName);
	                }
	            }
	        }
	        try {
	            product.setImages(mapper.writeValueAsString(imageNames));
	        } catch (JsonProcessingException e) {
	            e.printStackTrace();
	            model.addAttribute("message", "Error processing images.");
	            return "admin/add";
	        }
	    }

	    productRepo.save(product);
	    
	    List<Map<String, Object>> db = new ArrayList<>();
	    Map<String, Object> map = new HashMap<>();
	    map.put("product", product);
	    map.put("images", product.getImages());
	    db.add(map);

	    model.addAttribute("productDetails", db.get(0));
	    model.addAttribute("message", "Product added successfully!");

	    return "admin/add";
	}
	
}