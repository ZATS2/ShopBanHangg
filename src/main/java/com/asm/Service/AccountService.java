package com.asm.Service;

import java.util.List;

import com.asm.Entity.Account;
import com.asm.Entity.Role;
import com.asm.Entity.RoleDetail;


public interface AccountService {

	List<Account> findAll();
	
	Account findByUsername(String username);
	
	Account save(Account account);
	
	void deleteByUsername(String username);

	boolean existsById(String username);

	List<Account> findByFullname(String fullname);

	List<Role> findAllRole();

	List<RoleDetail> findAllAuthorities();

	RoleDetail saveRoleDetail(RoleDetail authority);

	void deleteRoleDetail(Long id);

	List<Account> findByUsernameLike(String username);

	Long countCustomer(String role);
	

}
