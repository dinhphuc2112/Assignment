package com.example.assignment.Controller;

import com.example.assignment.Entities.*;
import com.example.assignment.Repository.IOrderRepository;
import com.example.assignment.Service.*;
import com.example.assignment.dto.OrderRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    public GundamService gundamService;
    @Autowired
    public IOrderRepository oderResponsitory;
    @Autowired
    public CustomerService customerService;
    @Autowired
    public OrderService orderService;
    @Autowired
    public OrderDetailService orderDetailService;
    @Autowired
    public CartService cartService;

@PostMapping("/order")
@ResponseBody
public Object[] check(@RequestParam(name = "chk[]",required = false) Integer[] chk, @RequestParam(name="quantity[]",required = false) Integer[] quantity) {
    List<String> list=new ArrayList<>();
    if (chk==null) {
        list.add("Không có sản phẩm được chọn");
        return list.toArray();
    } else {
        int check=0;
        for (int i = 0; i < chk.length; i++) {
            Gundam gundam = gundamService.findById(chk[i]);
            if (gundam.getQuantity() < quantity[i]) {
                check++;
                list.add("Sản phẩm: "+gundam.getName()+" chỉ còn "+gundam.getQuantity()+"\n");
            }
        }
        if(check==0) {
            BigDecimal total = BigDecimal.ZERO;
            Customer customer = customerService.findByEmail("phuchdph17337@fpt.edu.vn");
            Order order = new Order();
            order.setAddress(customer.getAddress());
            order.setCreatedDate();
            order.setCustomer(customer);
            order.setTrangThai(0);
            order.setTotal(total);
            order = orderService.add(order);
            for (int i = 0; i < chk.length; i++) {
                OrderDetail orderDetail = new OrderDetail();
                Gundam gundam = gundamService.findById(chk[i]);
                orderDetail.setOrder(order);
                orderDetail.setPrice(gundam.getPrice());
                orderDetail.setGundam(gundam);
                orderDetail.setQuantity(quantity[i]);
                total = total.add(orderDetail.getPrice().multiply(new BigDecimal(orderDetail.getQuantity())));
                orderDetailService.add(orderDetail);
                gundam.setQuantity(gundam.getQuantity() - quantity[i]);
                gundamService.add( gundam);
                cartService.delete(cartService.getByGundam(gundam).getId());
            }
            order.setTotal(total);
            orderService.add(order);
            list.add("Thêm thành công");
            return list.toArray();
        }else {
            return list.toArray();
        }
    }
}
    @GetMapping("/listorder")
    private String allOrder(Model model,@RequestParam(name = "page",defaultValue = "0") Integer page) {
        List<Cart> carts = cartService.list();
        Integer size = carts.size();
        model.addAttribute("size", size);
        Page<Order> orders = oderResponsitory.findAll(PageRequest.of(page, 10));
        model.addAttribute("listorder", orders.getContent());
        model.addAttribute("currentPage", orders.getNumber());
        model.addAttribute("maxPage", orders.getTotalPages());
//        model.addAttribute("view", "/WEB-INF/views/allorder.jsp");
        return "allorder";
    }
    @GetMapping("/delete/{id}")
    private String deteteById(Model model,@PathVariable("id") Integer id) {
        cartService.delete(id);
        return "redirect:/cart";
    }
    @GetMapping("/cancle/{id}")
    private String updateTrangThai1(Model model,@PathVariable("id") Integer id) {
        Order order = orderService.getId(id);
        order.setTrangThai(1);
        List<OrderDetail> orderDetails=order.getOrderDetails();
        for(OrderDetail orderDetail : orderDetails) {
            Gundam gundam = orderDetail.getGundam();
            gundam.setQuantity(gundam.getQuantity()+ orderDetail.getQuantity());
            gundamService.add(gundam);
        }
        orderService.add(order);
        return "redirect:/listorder";
    }
    @GetMapping("/accept/{id}")
    private String updateTrangThai2(Model model,@PathVariable("id") Integer id) {
        Order order = orderService.getId(id);
        order.setTrangThai(2);
        orderService.add(order);
        return "redirect:/listorder";
    }
    @GetMapping("/listorderdetail/{id}")
    private String orderDetail(Model model,@PathVariable("id") Integer id) {
        Order order = orderService.getId(id);
        List<OrderDetail> orderDetails= orderDetailService.listOrderDetail(order);
        model.addAttribute("orderid", order);
        model.addAttribute("listdetail", orderDetails);
//        model.addAttribute("view", "/WEB-INF/views/detailorder.jsp");
        return "detailorder";
    }
}
