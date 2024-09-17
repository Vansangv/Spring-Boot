package com.example.demo.repository;

import com.example.demo.entity.HDCTIET;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HDCTietRepository extends JpaRepository<HDCTIET,Long> {


    Object findByTrangThai(String pending);
}
