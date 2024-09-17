package com.example.demo.controller;


import com.example.demo.entity.CTSPHAM;
import com.example.demo.entity.HDCTIET;
import com.example.demo.repository.CTSPhamRepository;
import com.example.demo.repository.HDCTietRepository;
import com.example.demo.repository.HoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
public class HDCTietController {

    @Autowired
    HDCTietRepository hdcTietRepository;

    @Autowired
    HoaDonRepository hoaDonRepository;

    @Autowired
    CTSPhamRepository ctsPhamRepository;


    @GetMapping("/HDCTiet/hienthi")
    public String show(Model model){
        model.addAttribute("HDCTlist",hdcTietRepository.findAll());
        model.addAttribute("HDonlist",hoaDonRepository.findAll());
        model.addAttribute("listCTSP",ctsPhamRepository.findAll());
        return "/Hdct/HDCT";
    }

    @PostMapping("/HDCTiet/add")
    private String addd(HDCTIET hdctiet){
        hdctiet.setNgaySua(new Date());
        hdctiet.setNgayTao(new Date());
        hdcTietRepository.save(hdctiet);
        return "redirect:/HDCTiet/hienthi";
    }


    @GetMapping("/HDCTiet/delete")
    public String delete(@RequestParam("id") Long id){
        ctsPhamRepository.deleteById(id);
        return "redirect:/HDCTiet/hienthi";
    }

    @GetMapping("/HDCTiet/detail/{id}")
    private String detail(@PathVariable Long id, Model model){
        HDCTIET hdctiet = hdcTietRepository.findById(id).get();
        model.addAttribute("hdct",hdctiet);
        model.addAttribute("HDCTlist",hdcTietRepository.findAll());
        model.addAttribute("HDonlist",hoaDonRepository.findAll());
        model.addAttribute("listCTSP",ctsPhamRepository.findAll());
        return "/Hdct/update";
    }

    @PostMapping("/HDCTiet/update")
    public String update(HDCTIET hdctiet){
        HDCTIET hdctiet1 = hdcTietRepository.getReferenceById(hdctiet.getId());
        if (hdctiet1!=null){
            hdctiet.setNgaySua(new Date());
            hdctiet.setNgayTao(hdctiet1.getNgayTao());
            hdcTietRepository.save(hdctiet);
        }
        return "redirect:/HDCTiet/hienthi";
    }



}
