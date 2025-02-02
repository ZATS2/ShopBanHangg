package com.asm.Service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.asm.Entity.Brand;


public interface BrandService {

	List<Brand> findAll();

	Brand findById(String id);

	boolean existsById(String id);

	Brand save(Brand brand);

	void deleteById(String id);

	List<Brand> findByName(String kw);
	
}
