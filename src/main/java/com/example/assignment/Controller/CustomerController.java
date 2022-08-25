package com.example.assignment.Controller;

import com.example.assignment.Constrant.SessionArr;
import com.example.assignment.Entities.Customer;
import com.example.assignment.Service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class CustomerController {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private CustomerService customerService;

    @GetMapping("/registration")
    private String registration(Model model) {
        return "index";
    }
    @PostMapping("/signup")
    private String signUp(Model model, Customer customer) {
        HttpSession session = request.getSession();
        customerService.add(customer);
        session.setAttribute(SessionArr.CURRENT_customer, customer);
        return "redirect:/index";
    }
    @GetMapping("/login")
    private String form(Model model) {
        return "login";
    }
    @GetMapping("/customer/login")
    private String login(Model model, @RequestParam("email") String email, @RequestParam("pass") String pass) {
        HttpSession session = request.getSession();
        Customer customer = customerService.findByEmail(email);
        String confirmPass = request.getParameter(pass);
        if(customer.getPass() == confirmPass) {
            session.setAttribute(SessionArr.CURRENT_customer, customer);
            System.out.println("Thành công");
        }else {
            System.out.println("that bai");
            return "redirect:/index";
        }
        return "redirect:/index";
    }
    @GetMapping("/logout")
    private String logout(Model model) {
        HttpSession session = request.getSession();
        session.removeAttribute(SessionArr.CURRENT_customer);
        return "redirect:/index";
    }
}
