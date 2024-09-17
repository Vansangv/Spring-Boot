package com.example.demo.controller;

import com.example.demo.entity.DanhMuc;
import com.example.demo.entity.KhachHang;
import com.example.demo.repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
public class KhachHangController {

    @Autowired
    KhachHangRepository khachHangRepository;
    @GetMapping("/Khang/hienthi")
    public String show(Model model){
        model.addAttribute("listKHang",khachHangRepository.findAll());
        return "/Kh/KHang";
    }

    @PostMapping("/Khang/add")
    public String add(KhachHang khachHang){
        khachHang.setNgaySua(new Date());
        khachHang.setNgayTao(new Date());
        khachHangRepository.save(khachHang);
        return "redirect:/Khang/hienthi";
    }

    @GetMapping("/Khang/delete")
    public String delete(@RequestParam("id") Long id){
        khachHangRepository.deleteById(id);
        return "redirect:/Khang/hienthi";
    }

    @GetMapping("/Khang/detail/{id}")
    private String detail(@PathVariable Long id, Model model){
        KhachHang khachHang= khachHangRepository.findById(id).get();
        model.addAttribute("kh",khachHang);
        model.addAttribute("listKHang",khachHangRepository.findAll());
        return "/Kh/update";
//            return "/Si/Size";
    }


    @PostMapping("/Khang/update")
    public String update(KhachHang khachHang){
        KhachHang khachHang1 = khachHangRepository.getReferenceById(khachHang.getId());
        if (khachHang1!=null){
            khachHang.setNgaySua(new Date());
            khachHang.setNgayTao(khachHang1.getNgayTao());
            khachHangRepository.save(khachHang);
        }
        return "redirect:/Khang/hienthi";
    }

}
