package com.example.demo.controller;

import com.example.demo.entity.DanhMuc;
import com.example.demo.entity.Size;
import com.example.demo.repository.DanhMucRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller

public class DanhMucController {

    @Autowired
    DanhMucRepository danhMucRepository;

    @GetMapping("/DMuc/hienthi")
    public String show(Model model){
        model.addAttribute("DMuclist",danhMucRepository.findAll());
        return "/Dm/dmuc";
    }

    @PostMapping("/DMuc/add")
    public String add(DanhMuc danhMuc){
        danhMuc.setNgaySua(new Date());
        danhMuc.setNgayTao(new Date());
        danhMucRepository.save(danhMuc);
        return "redirect:/DMuc/hienthi";
    }

    @GetMapping("/DMuc/delete")
    public String delete(@RequestParam("id") Long id){
        danhMucRepository.deleteById(id);
        return "redirect:/DMuc/hienthi";
    }

    @GetMapping("/DMuc/detail/{id}")
    private String detail(@PathVariable Long id, Model model){
        DanhMuc danhMuc = danhMucRepository.findById(id).get();
        model.addAttribute("dm",danhMuc);
        model.addAttribute("DMuclist",danhMucRepository.findAll());
        return "/Dm/update";
//            return "/Si/Size";
    }



    @PostMapping("/DMuc/update")
    public String update(DanhMuc danhMuc){
        DanhMuc danhMuc1 = danhMucRepository.getReferenceById(danhMuc.getId());
        if (danhMuc1!=null){
            danhMuc.setNgaySua(new Date());
            danhMuc.setNgayTao(danhMuc1.getNgayTao());
            danhMucRepository.save(danhMuc);
        }
        return "redirect:/DMuc/hienthi";
    }
}
