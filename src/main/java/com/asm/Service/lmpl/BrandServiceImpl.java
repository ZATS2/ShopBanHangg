package com.asm.Service.lmpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.asm.Dao.BrandRepo;
import com.asm.Entity.Brand;
import com.asm.Service.BrandService;



@Service
public class BrandServiceImpl implements BrandService{
	@Autowired BrandRepo bRepo;

	@Override
	public List<Brand> findAll() {
		Sort sort = Sort.by(Direction.ASC, "name");
		return bRepo.findAll(sort);
	}

	@Override
	public Brand findById(String id) {
		return bRepo.findById(id).get();
	}

	@Override
	public boolean existsById(String id) {
		return bRepo.existsById(id);
	}

	@Override
	public Brand save(Brand brand) {
		return bRepo.save(brand);
	}

	@Override
	public void deleteById(String id) {
		bRepo.deleteById(id);
	}

	@Override
	public List<Brand> findByName(String kw) {
		System.out.println(kw);
		return bRepo.findByName(kw);
	}
	
}
