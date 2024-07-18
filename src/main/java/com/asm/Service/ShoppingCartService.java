package com.asm.Service;

import com.asm.Dao.ProductRepo;
import com.asm.Entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ShoppingCartService {

    @Autowired
    private ProductRepo productRepo;

    @Autowired
    private HttpSession session;

    private List<Product> getCart() {
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        return cart;
    }
    

    public void addProduct(Long productId) {
        List<Product> cart = getCart();
        Optional<Product> productOpt = productRepo.findById(productId);
        productOpt.ifPresent(product -> {
            boolean found = false;
            for (Product p : cart) {
                if (p.getId().equals(product.getId())) {
                    p.setQuantity(p.getQuantity() + 1);
                    found = true;
                    break;
                }
            }
            if (!found) {
                product.setQuantity(1);
                cart.add(product);
            }
        });
    }

    public void removeProduct(Long productId) {
        List<Product> cart = getCart();
        cart.removeIf(product -> product.getId().equals(productId));
    }

    public void updateProductQuantity(Long productId, int quantity) {
        List<Product> cart = getCart();
        for (Product p : cart) {
            if (p.getId().equals(productId)) {
                p.setQuantity(quantity);
                break;
            }
        }
    }

    public void clearCart() {
        session.removeAttribute("cart");
    }

    public List<Product> getCartItems() {
        return getCart();
    }

    public double getTotalAmount() {
        List<Product> cart = getCart();
        return cart.stream().mapToDouble(p -> p.getPrice() * p.getQuantity()).sum();
    }
}
