package com.asm.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.Dao.ProductRepo;
import com.asm.Entity.Product;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ListItem {
    @Autowired
    ProductRepo pRepo;

    @GetMapping("/{price}")
    public String filterByPrice(Model model, @PathVariable("price") String price,
                                @RequestParam("page") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 9);
        Page<Product> data;

        switch (price.toLowerCase()) {
            case "under100":
                data = pRepo.findByPriceBetween(0.0, 100000.0, pageable);
                break;
            case "100-300":
                data = pRepo.findByPriceBetween(100000.0, 300000.0, pageable);
                break;
            case "300-900":
                data = pRepo.findByPriceBetween(300000.0, 900000.0, pageable);
                break;
            case "over900":
                data = pRepo.findByPriceBetween(900000.0, Double.MAX_VALUE, pageable);
                break;
            default:
                data = pRepo.findAll(pageable);
                break;
        }

        List<Map<String, Object>> db = new ArrayList<>();
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<String>> typeString = new TypeReference<List<String>>() {};

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


    @GetMapping("/sort")
    public String sortBy(Model model, @RequestParam("sortBy") Optional<String> sortBy,
                         @RequestParam("page") Optional<Integer> page) {
        String sortField = "name";
        Sort.Direction sortDirection = Sort.Direction.ASC;

        if (sortBy.isPresent()) {
            switch (sortBy.get()) {
                case "A-Z":
                    sortField = "name";
                    sortDirection = Sort.Direction.ASC;
                    break;
                case "Z-A":
                    sortField = "name";
                    sortDirection = Sort.Direction.DESC;
                    break;
                case "Giá, thấp đến cao":
                    sortField = "price";
                    sortDirection = Sort.Direction.ASC;
                    break;
                case "Giá, cao đến thấp":
                    sortField = "price";
                    sortDirection = Sort.Direction.DESC;
                    break;
                default:
                    sortField = "name";
                    sortDirection = Sort.Direction.ASC;
                    break;
            }
        }

        Pageable pageable = PageRequest.of(page.orElse(0), 9, Sort.by(sortDirection, sortField));
        Page<Product> productPage = pRepo.findAll(pageable);

        List<Product> products = productPage.getContent();
        List<Map<String, Object>> db = new ArrayList<>();

        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<String>> typeString = new TypeReference<List<String>>() {
        };

        try {
            for (Product p : products) {
                Map<String, Object> map = new HashMap<>();
                map.put("product", p);
                map.put("images", mapper.readValue(p.getImages(), typeString));
                db.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("page", db);
        model.addAttribute("currentPage", productPage.getNumber());
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("sortBy", sortBy.orElse("title-ascending"));

        return "user/SP";
    }
    
}
