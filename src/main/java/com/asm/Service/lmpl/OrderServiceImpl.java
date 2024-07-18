package com.asm.Service.lmpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asm.Dao.OrderDetailRepo;
import com.asm.Dao.OrderRepo;
import com.asm.Entity.Account;
import com.asm.Entity.Order;
import com.asm.Entity.OrderDetail;
import com.asm.Entity.Product;
import com.asm.Service.OrderService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderRepo oRepo;
	@Autowired
	OrderDetailRepo odRepo;
	  
	@Override
	public Order create(JsonNode orderData) {
		ObjectMapper mapper = new ObjectMapper();
		Order order = mapper.convertValue(orderData, Order.class);
		oRepo.save(order);

		TypeReference<List<OrderDetail>> type = new TypeReference<List<OrderDetail>>() {
		};
		List<OrderDetail> details = mapper.convertValue(orderData.get("orderDetails"), type).stream()
				.peek(d -> d.setOrder(order)).collect(Collectors.toList());
		odRepo.saveAll(details);
		return order;
	}

	@Override
	public Order findById(Long id) {
		return oRepo.findById(id).get();
	}

	@Override
	public List<Order> findByUsername(String username) {
		return oRepo.findByUsername(username);
	}

	@Override
	public List<Order> findOrderInMonth(Integer month) {
		return oRepo.findOrderInMonth(month);
	}

	@Override
	public Integer countOrderInMonth(Integer month) {
		return oRepo.countOrderInMonth(month);
	}

	@Override
	public void processOrder(String fullname, String email, String address, String note, List<Map<String, Object>> cart,
			String username) {
		Order order = new Order();
		order.setAddress(address);
		Account account = new Account();
		account.setUsername(username);
		order.setAccount(account);

		oRepo.save(order);

		// Create OrderDetails
		for (Map<String, Object> item : cart) {
			Product product = (Product) item.get("product");
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder(order);
			orderDetail.setProduct(product);
			orderDetail.setPrice(product.getPrice());
			orderDetail.setQuantity(product.getQuantity());

			odRepo.save(orderDetail);
		}
	}

}
