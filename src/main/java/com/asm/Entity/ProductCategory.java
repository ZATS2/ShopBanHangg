package com.asm.Entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Productcategory")
public class ProductCategory implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name = "productid")
	private Product product;
	@ManyToOne
	@JoinColumn(name = "categoryid")
	private Category category;
	public Long getId() {
		return id;
	}
	public Product getProduct() {
		return product;
	}
	public Category getCategory() {
		return category;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	
}
