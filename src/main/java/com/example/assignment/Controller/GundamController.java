package com.example.assignment.Controller;

import com.example.assignment.Entities.Gundam;
import com.example.assignment.Entities.Type;
import com.example.assignment.Repository.IGundamRepository;
import com.example.assignment.Service.GundamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class GundamController {
    @Autowired
    private IGundamRepository gundamRepository;
    @Autowired
    private GundamService gundamService;

    @GetMapping("/index")
    private String showIndex(Model model, @RequestParam(name = "name", defaultValue = "") String name) {
        List<Gundam> gundam = gundamService.getByName(name);
        model.addAttribute("listgundam", gundam);
//        model.addAttribute("view", "/WEB-INF/views/shop.jsp");
//        System.out.println(gundam);
        return "shop";
    }

    @GetMapping("/allgundam")
    private String showAllWGundam(Model model,@RequestParam(name = "page",defaultValue = "0") Integer page) {
        Page<Gundam> gundam = gundamRepository.findAll(PageRequest.of(page, 10));
        model.addAttribute("listgundam", gundam.getContent());
        model.addAttribute("currentPage", gundam.getNumber());
        model.addAttribute("maxPage", gundam.getTotalPages());
        return "all";

    }

    @GetMapping("/gundam/add")
    private String addGundam(Model model, Gundam gundam) {
        Type[] gundamType = Type.values();
        model.addAttribute("type", gundamType);
//        model.addAttribute("view", "/WEB-INF/views/add.jsp");
        return "add";
    }
    @PostMapping("/gundam/new")
    private String newGundam(Gundam gundam) {
        gundam.setCreatedDate();
        gundamService.add(gundam);
        return "redirect:/allgundam";
    }
    @GetMapping("/gundam/edit")
    private String editProduct(@RequestParam(name = "id") Integer id,Model model) {
        Type[] types = Type.values();
        Gundam w = gundamService.findById(id);
        model.addAttribute("gundam", w);
        model.addAttribute("type", types);
//        model.addAttribute("view","/WEB-INF/views/update.jsp");
        return "update";
    }
    @PostMapping("/gundam/update")
    private String updateGundam(@RequestParam(name = "id") Integer id,Gundam gundam) {
        gundam.setCreatedDate();
        gundamService.update(id, gundam);
        return "redirect:/allgundam";
    }
    @GetMapping("/gundam/delete")
    public String delete(@RequestParam(name = "id") Integer id) {
        gundamService.delete(id);
        return "redirect:/allgundam";
    }
    @GetMapping("/detail/{id}")
    private String detail(Model model,@PathVariable("id") Integer id) {
        Gundam gundam = gundamService.findById(id);
        List<Gundam> w = gundamRepository.findAll();
        model.addAttribute("listgundam", w);
        model.addAttribute("gundam", gundam);
//        model.addAttribute("view", "/WEB-INF/views/detail.jsp");
        return "detail";
    }
}
