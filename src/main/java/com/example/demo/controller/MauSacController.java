package com.example.demo.controller;


import com.example.demo.entity.MauSac;
import com.example.demo.entity.Size;
import com.example.demo.repository.MauSacRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
public class MauSacController {

    @Autowired
    MauSacRepository mauSacRepository;
    @GetMapping("/MSac/hienthi")
    public String show(Model model){
        model.addAttribute("listMSac",mauSacRepository.findAll());
        return "/Ms/MSac";
    }
    @PostMapping("/MauSac/add")
    public String add(MauSac mauSac){
        mauSac.setNgaySua(new Date());
        mauSac.setNgayTao(new Date());
        mauSacRepository.save(mauSac);
        return "redirect:/MSac/hienthi";
    }

    @GetMapping("/MauSac/delete")
    public String delete(@RequestParam("id") Long id){
        mauSacRepository.deleteById(id);
        return "redirect:/MSac/hienthi";
    }

    @GetMapping("/MauSac/detail/{id}")
    private String detail(@PathVariable Long id, Model model){
        MauSac mauSac = mauSacRepository.findById(id).get();
        model.addAttribute("ms",mauSac);
        model.addAttribute("listMSac",mauSacRepository.findAll());
        return "/Ms/update";
//            return "/Si/Size";
    }

    @PostMapping("/MauSac/update")
    public String update(MauSac mauSac){
        MauSac mauSac1 = mauSacRepository.getReferenceById(mauSac.getId());
        if (mauSac1!=null){
            mauSac.setNgaySua(new Date());
            mauSac.setNgayTao(mauSac1.getNgayTao());
            mauSacRepository.save(mauSac);
        }
        return "redirect:/MSac/hienthi";
    }
}
