package com.asm.Entity;

import java.util.Date;
import java.util.List;
import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private Double price;
    @Temporal(TemporalType.DATE)
    @Column(name = "createdate")
    private Date createDate = new Date();
    private Boolean available;
    private String brandId;
    @ElementCollection
    private List<String> images;

    @Transient
    private Integer qty;
    public Item(Long id, String name, Double price, Date createDate, Boolean available, String brandId, List<String> images, Integer qty) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.createDate = createDate;
        this.available = available;
        this.brandId = brandId;
        this.images = images;
        this.qty = qty;
    }

	public Long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public Double getPrice() {
		return price;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public Boolean getAvailable() {
		return available;
	}

	public String getBrandId() {
		return brandId;
	}

	public List<String> getImages() {
		return images;
	}

	public Integer getQty() {
		return qty;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public void setAvailable(Boolean available) {
		this.available = available;
	}

	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}

	public void setImages(List<String> images) {
		this.images = images;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}
    
}
