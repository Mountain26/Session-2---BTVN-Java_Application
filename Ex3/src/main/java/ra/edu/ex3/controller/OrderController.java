package ra.edu.ex3.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ra.edu.ex3.model.Order;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {

    @GetMapping("/orders")
    public String showOrders(HttpSession session, Model model) {
        // Kiểm tra xem đã đăng nhập chưa, chưa thì đuổi về trang login
        if (session == null || session.getAttribute("loggedUser") == null) {
            return "redirect:/login?msg=unauthorized";
        }

        // Tạo danh sách đơn hàng giả
        List<Order> orders = new ArrayList<>();
        orders.add(new Order("DH01", "Bàn phím cơ Mlog", 1500000, new Date()));
        orders.add(new Order("DH02", "Chuột không dây X", 850000, new Date()));
        orders.add(new Order("DH03", "Màn hình 24 inch", 4500000, new Date()));

        // Đẩy danh sách ra View
        model.addAttribute("orders", orders);

        // Tăng bộ đếm tổng lượt xem hệ thống an toàn (chống Race Condition)
        ServletContext app = session.getServletContext();
        synchronized (app) {
            Integer count = (Integer) app.getAttribute("totalViewCount");
            if (count == null) {
                count = 0;
            }
            app.setAttribute("totalViewCount", count + 1);
        }

        return "orders"; // Trỏ tới file orders.jsp
    }
}