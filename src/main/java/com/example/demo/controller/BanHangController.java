package com.example.demo.controller;

import com.example.demo.entity.CTSPHAM;
import com.example.demo.entity.HDCTIET;
import com.example.demo.entity.HoaDon;
import com.example.demo.repository.CTSPhamRepository;
import com.example.demo.repository.DanhMucRepository;
import com.example.demo.repository.HDCTietRepository;
import com.example.demo.repository.HoaDonRepository;
import com.example.demo.repository.KhachHangRepository;
import com.example.demo.repository.MauSacRepository;
import com.example.demo.repository.SanPhamRepository;
import com.example.demo.repository.SizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class BanHangController {
    @Autowired
    CTSPhamRepository ctsPhamRepository;
    @Autowired
    DanhMucRepository danhMucRepository;
    @Autowired
    SanPhamRepository sanPhamRepository;
    @Autowired
    MauSacRepository mauSacRepository;
    @Autowired
    SizeRepository sizeRepository;
    @Autowired
    HoaDonRepository hoaDonRepository;
    @Autowired
    HDCTietRepository hdcTietRepository;
    @Autowired
    KhachHangRepository khachHangRepository;

    @GetMapping("/ban-hang")
    public String showBanHang(Model model) {
        model.addAttribute("sp", sanPhamRepository.findAll());
        model.addAttribute("ms", mauSacRepository.findAll());
        model.addAttribute("s", sizeRepository.findAll());
        model.addAttribute("kh", khachHangRepository.findAll());
        model.addAttribute("ds", ctsPhamRepository.findAll());
        model.addAttribute("hd", hdcTietRepository.findByTrangThai("Pending"));
        return "trang-chu/trang-chu";
    }

    @PostMapping("/ban-hang/add")
    public String addHoaDonChiTiet(@RequestParam(name = "hoaDonId") Long hoaDonId,
                                   @RequestParam(name = "sanPhamCTId") Long sanPhamCTId,
                                   @RequestParam(name = "soLuong") int Long,Model model
    ) {

        HoaDon hoaDon = hoaDonRepository.findById(hoaDonId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid hoa don ID: " + hoaDonId));
        CTSPHAM ctspham = ctsPhamRepository.findById(sanPhamCTId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid san pham chi tiet ID: " + sanPhamCTId));

        HDCTIET hdct = new HDCTIET();
        hdct.setHoaDon(hoaDon);
        hdct.setCtspham(ctspham);
        hdct.setSoLuongMua(0);
        model.addAttribute("sp", sanPhamRepository.findAll());
        model.addAttribute("ms", mauSacRepository.findAll());
        model.addAttribute("s", sizeRepository.findAll());
        model.addAttribute("kh", khachHangRepository.findAll());
        model.addAttribute("ds", ctsPhamRepository.findAll());
        model.addAttribute("hd", hdcTietRepository.findByTrangThai("Pending"));
        hdcTietRepository.save(hdct);

        return "redirect:/ban-hang";
    }
}
