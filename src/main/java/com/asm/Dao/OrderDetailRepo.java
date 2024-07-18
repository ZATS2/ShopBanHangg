package com.asm.Dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.asm.Entity.OrderDetail;



@Repository
public interface OrderDetailRepo extends JpaRepository<OrderDetail, Long>{

}
