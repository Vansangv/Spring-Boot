package com.example.demo.controller;

import com.example.demo.entity.SanPham;
import com.example.demo.repository.DanhMucRepository;
import com.example.demo.repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class test {

    @Autowired
    SanPhamRepository sanPhamRepository;

    @Autowired
    DanhMucRepository danhMucRepository;

    @GetMapping("sanpham/hienthi")
    public String show(Model model){
        model.addAttribute("listSP",sanPhamRepository.findAll());
        model.addAttribute("listDM",danhMucRepository.findAll());
        return "Sp/SPham";
    }

   @PostMapping("sanpham/add")
    public String them(SanPham sanPham){
        sanPhamRepository.save(sanPham);
        return "redirect:sanpham/hienthi";
   }

  @GetMapping("sanpham/delete")
    public String xoa(@RequestParam("id") Long id){
        sanPhamRepository.deleteById(id);
        return "ridirect:sanpham/hienthi";
  }






}
