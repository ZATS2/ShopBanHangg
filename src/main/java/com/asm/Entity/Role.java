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
@Table(name = "Roles")
public class Role implements Serializable{
	@Id
	private String role;
	private String description;
	@JsonIgnore
	@OneToMany(mappedBy = "role")
	private List<RoleDetail> roleDetails;
	public String getRole() {
		return role;
	}
	public String getDescription() {
		return description;
	}
	public List<RoleDetail> getRoleDetails() {
		return roleDetails;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setRoleDetails(List<RoleDetail> roleDetails) {
		this.roleDetails = roleDetails;
	}
	
}
