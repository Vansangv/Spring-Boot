package com.example.demo.controller;

import com.example.demo.entity.CTSPHAM;
import com.example.demo.entity.SanPham;
import com.example.demo.repository.CTSPhamRepository;
import com.example.demo.repository.MauSacRepository;
import com.example.demo.repository.SanPhamRepository;
import com.example.demo.repository.SizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
public class CTSPhamController {
    @Autowired
    CTSPhamRepository ctsPhamRepository;

    @Autowired
    SanPhamRepository sanPhamRepository;

    @Autowired
    MauSacRepository mauSacRepository;

    @Autowired
    SizeRepository sizeRepository;

    @GetMapping("/CTSP/hienthi")
    public String show(Model model){
        model.addAttribute("listCTSP",ctsPhamRepository.findAll());
        model.addAttribute("listSPham",sanPhamRepository.findAll());
        model.addAttribute("listMau",mauSacRepository.findAll());
        model.addAttribute("listSize",sizeRepository.findAll());
        return "Ctsp/CTSP";
    }


    @PostMapping("/CTSP/add")
    private String addd(CTSPHAM ctspham){
        ctspham.setNgaySua(new Date());
        ctspham.setNgayTao(new Date());
        ctsPhamRepository.save(ctspham);
        return "redirect:/CTSP/hienthi";
    }


    @GetMapping("/CTSP/delete")
    public String delete(@RequestParam("id") Long id){
        ctsPhamRepository.deleteById(id);
        return "redirect:/CTSP/hienthi\"";
    }

    @GetMapping("/CTSP/detail/{id}")
    private String detail(@PathVariable Long id, Model model){
        CTSPHAM ctspham= ctsPhamRepository.findById(id).get();
        model.addAttribute("ctsp",ctspham);
        model.addAttribute("listCTSP",ctsPhamRepository.findAll());
        model.addAttribute("listSPham",sanPhamRepository.findAll());
        model.addAttribute("listMau",mauSacRepository.findAll());
        model.addAttribute("listSize",sizeRepository.findAll());
        return "/Ctsp/update";
    }

    @PostMapping("/CTSP/update")
    public String update(CTSPHAM ctspham){
        CTSPHAM ctspham1 = ctsPhamRepository.getReferenceById(ctspham.getId());
        if (ctspham1!=null){
            ctspham.setNgaySua(new Date());
            ctspham.setNgayTao(ctspham1.getNgayTao());
            ctsPhamRepository.save(ctspham);
        }
        return "redirect:/CTSP/hienthi";
    }






}
