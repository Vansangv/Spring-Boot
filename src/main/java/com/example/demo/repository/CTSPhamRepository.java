package com.example.demo.repository;

import com.example.demo.entity.CTSPHAM;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CTSPhamRepository extends JpaRepository<CTSPHAM,Long> {
}
