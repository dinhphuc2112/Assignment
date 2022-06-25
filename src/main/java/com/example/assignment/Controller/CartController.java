package com.example.assignment.Controller;

import com.example.assignment.Entities.Cart;
import com.example.assignment.Entities.Customer;
import com.example.assignment.Entities.Gundam;
import com.example.assignment.Service.CartService;
import com.example.assignment.Service.CustomerService;
import com.example.assignment.Service.GundamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class CartController {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private CartService cartService;
    @Autowired
    private GundamService gundamService;
    @Autowired
    private CustomerService customerService;

    @GetMapping("/cart")
    private String showIndex(Model model) {
        List<Cart> carts = cartService.list();
        System.out.println(carts);
        model.addAttribute("listcart", carts);
        model.addAttribute("view", "/WEB-INF/views/cart.jsp");
        return "index";
    }
    @GetMapping("/addcart/{id}")
    private String add(@PathVariable Integer id, Cart cart, @RequestParam("quantity") Integer quantity) {
        Gundam gundam = gundamService.findById(id);
        Customer customer= customerService.findByEmail("phuchdph17337@fpt.edu.vn");
        System.out.println(gundam);
        System.out.println(customer);
        cart.setCustomer(customer);
        cart.setPrice(gundam.getPrice());
        Cart c=cartService.getByGundam(gundam);
        if(c==null) {
            cart.setGundam(gundam);
            cart.setQuantity(quantity);
            cartService.add(cart);
        }else {
            c.setQuantity(quantity+c.getQuantity());
            cartService.add(c);
        }
        return "redirect:/index";
    }
    @GetMapping("/listcart")
    private String showCart(Model model) {
        model.addAttribute("view", "/WEB-INF/views/cart.jsp");
        return "index";
    }
}
