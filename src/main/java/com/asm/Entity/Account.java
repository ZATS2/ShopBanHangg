package com.asm.Entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
@Table(name = "Accounts")
public class Account implements Serializable{
	@Id
	private String username;
	private String password;
	private String fullname;
	private String email;
	private String photo;
	private Boolean activated;
	@JsonIgnore
	@OneToMany(mappedBy = "account", fetch = FetchType.EAGER)
//	@Column(name = "roledetails")
	private List<RoleDetail> roleDetails;
	@JsonIgnore
	@OneToMany(mappedBy = "account")
	private List<Order> orders;
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	public String getFullname() {
		return fullname;
	}
	public String getEmail() {
		return email;
	}
	public String getPhoto() {
		return photo;
	}
	public Boolean getActivated() {
		return activated;
	}
	public List<RoleDetail> getRoleDetails() {
		return roleDetails;
	}
	public List<Order> getOrders() {
		return orders;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public void setActivated(Boolean activated) {
		this.activated = activated;
	}
	public void setRoleDetails(List<RoleDetail> roleDetails) {
		this.roleDetails = roleDetails;
	}
	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	
}
