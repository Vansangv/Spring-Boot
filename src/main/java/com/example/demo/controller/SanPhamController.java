package com.example.demo.controller;


import com.example.demo.entity.SanPham;
import com.example.demo.repository.DanhMucRepository;
import com.example.demo.repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
;import java.util.Date;


@Controller
public class SanPhamController {

    @Autowired
    SanPhamRepository sanPhamRepository;

    @Autowired
    DanhMucRepository danhMucRepository;

    @GetMapping("/Sanpham/hienthi")
    public String show(Model model){
        model.addAttribute("listSPham",sanPhamRepository.findAll());
        model.addAttribute("listDM",danhMucRepository.findAll());
         return "Sp/SPham";
    }

    @PostMapping("/Sanpham/add")
    private String addSach(SanPham sanPham){
        sanPham.setNgaySua(new Date());
        sanPham.setNgayTao(new Date());
        sanPhamRepository.save(sanPham);
        return "redirect:/Sanpham/hienthi";
    }

    @GetMapping("/Sanpham/delete")
    public String delete(@RequestParam("id") Long id){
        sanPhamRepository.deleteById(id);
        return "redirect:/Sanpham/hienthi";
    }

    @GetMapping("/Sanpham/detail/{id}")
    private String detail(@PathVariable Long id, Model model){
        SanPham sanPham = sanPhamRepository.findById(id).get();
        model.addAttribute("sp",sanPham);
        model.addAttribute("listSPham",sanPhamRepository.findAll());
        model.addAttribute("listDM",danhMucRepository.findAll());
        return "/Sp/update";
    }

    @PostMapping("/Sanpham/update")
    public String update(SanPham sanPham){
        SanPham sanPham1 = sanPhamRepository.getReferenceById(sanPham.getId());
        if (sanPham1!=null){
            sanPham.setNgaySua(new Date());
            sanPham.setNgayTao(sanPham1.getNgayTao());
            sanPhamRepository.save(sanPham);
        }
        return "redirect:/Sanpham/hienthi   ";
    }


}
