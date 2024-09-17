package com.example.demo.controller;


import com.example.demo.entity.HoaDon;
import com.example.demo.repository.HoaDonRepository;
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
public class HoaDonController {
    @Autowired
    HoaDonRepository hoaDonRepository;

    @Autowired
    KhachHangRepository khachHangRepository;

    @GetMapping("/HDon/hienthi")
    public String show(Model model){
        model.addAttribute("HDonlist",hoaDonRepository.findAll());
        model.addAttribute("listKHang",khachHangRepository.findAll());
        return "Hd/HDon";
    }

    @PostMapping("/HDon/add")
    private String addSach(HoaDon hoaDon){
        hoaDon.setNgaySua(new Date());
        hoaDon.setNgayTao(new Date());
        hoaDonRepository.save(hoaDon);
        return "redirect:/HDon/hienthi";
    }

    @GetMapping("/HDon/delete")
    public String delete(@RequestParam("id") Long id){
        hoaDonRepository.deleteById(id);
        return "redirect:/HDon/hienthi";
    }

    @GetMapping("/HDon/detail/{id}")
    private String detail(@PathVariable Long id, Model model){
        HoaDon hoaDon = hoaDonRepository.findById(id).get();
        model.addAttribute("hd",hoaDon);
        model.addAttribute("HDonlist",hoaDonRepository.findAll());
        model.addAttribute("listKHang",khachHangRepository.findAll());
        return "/Hd/update";
    }

    @PostMapping("/HDon/update")
    public String update(HoaDon hoaDon){
        HoaDon hoaDon1 = hoaDonRepository.getReferenceById(hoaDon.getId());
        if (hoaDon1!=null){
            hoaDon.setNgaySua(new Date());
            hoaDon.setNgayTao(hoaDon1.getNgayTao());
            hoaDonRepository.save(hoaDon);
        }
        return "redirect:/HDon/hienthi";
    }


}
