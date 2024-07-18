package com.asm.Entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Categories")
public class Category implements Serializable{
	@Id
	private String id;
	private String name;
	@JsonIgnore
	@OneToMany(mappedBy = "category")
	private List<ProductCategory> ProductCategories;
	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public List<ProductCategory> getProductCategories() {
		return ProductCategories;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setProductCategories(List<ProductCategory> productCategories) {
		ProductCategories = productCategories;
	}
	
}
