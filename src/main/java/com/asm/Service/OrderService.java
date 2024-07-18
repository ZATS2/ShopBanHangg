package com.asm.Service;

import java.util.List;
import java.util.Map;

import com.asm.Entity.Order;
import com.fasterxml.jackson.databind.JsonNode;

public interface OrderService {

	Order create(JsonNode order);

	Order findById(Long id);

	List<Order> findByUsername(String username);

//	Double sumCostInMonth(Integer month);

	List<Order> findOrderInMonth(Integer month);

	Integer countOrderInMonth(Integer month);

	void processOrder(String fullname, String email, String address, String note, List<Map<String, Object>> cart,
			String username);
	
}
