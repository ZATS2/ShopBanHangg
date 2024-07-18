package com.asm.Dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.asm.Entity.RoleDetail;



@Repository
public interface RoleDetailRepo extends JpaRepository<RoleDetail, Long>{

}
