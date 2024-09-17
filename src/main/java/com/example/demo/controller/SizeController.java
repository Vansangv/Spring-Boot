package com.example.demo.controller;


import com.example.demo.entity.Size;
import com.example.demo.repository.SizeRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
public class SizeController {
    @Autowired
    SizeRepository sizeRepository;
        @GetMapping("/Size/hienthi")
         public String show(Model model){
        model.addAttribute("listSize",sizeRepository.findAll());
        return "/Si/Size";
    }

    @PostMapping("/Size/add")
    public String add(Size size){
        size.setNgaySua(new Date());
        size.setNgayTao(new Date());
        sizeRepository.save(size);
        return "redirect:/Size/hienthi";
    }

    @GetMapping("/Size/delete")
    public String delete(@RequestParam("id") Long id){
        sizeRepository.deleteById(id);
        return "redirect:/Size/hienthi";
    }

    @GetMapping("/Size/detail/{id}")
    private String detail(@PathVariable Long id,Model model){
        Size size = sizeRepository.findById(id).get();
        model.addAttribute("si",size);
        model.addAttribute("listSize",sizeRepository.findAll());
          return "/Si/update";
//            return "/Si/Size";
    }


    @PostMapping("/Size/update")
    public String update(Size size){
        Size size1 = sizeRepository.getReferenceById(size.getId());
        if (size1!=null){
            size.setNgaySua(new Date());
            size.setNgayTao(size1.getNgayTao());
            sizeRepository.save(size);
        }
        return "redirect:/Size/hienthi";
    }

}

    

