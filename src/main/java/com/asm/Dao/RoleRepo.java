package com.asm.Dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.asm.Entity.Role;



@Repository
public interface RoleRepo extends JpaRepository<Role, String>{

}
