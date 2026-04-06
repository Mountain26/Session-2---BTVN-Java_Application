package ra.edu.ex3.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {

    @GetMapping("/")
    public String home() {
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String showLogin(@RequestParam(value = "msg", required = false) String msg, Model model) {
        if ("unauthorized".equals(msg)) {
            model.addAttribute("error", "Vui lòng đăng nhập để xem đơn hàng!");
        }
        return "login"; // Trỏ tới file login.jsp
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam("username") String username,
                               @RequestParam("password") String password,
                               HttpSession session,
                               Model model) {

        username = username.trim();
        password = password.trim();

        // Đúng tài khoản thì lưu session và chuyển hướng sang trang orders
        if ("admin".equals(username) && "admin123".equals(password)) {
            session.setAttribute("loggedUser", "Quản trị viên");
            session.setAttribute("role", "ADMIN");
            return "redirect:/orders";
        } else if ("staff".equals(username) && "staff123".equals(password)) {
            session.setAttribute("loggedUser", "Nhân viên Bán hàng");
            session.setAttribute("role", "STAFF");
            return "redirect:/orders";
        }

        model.addAttribute("error", "Tài khoản hoặc mật khẩu không đúng!");
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Xóa session hiện tại
        return "redirect:/login"; // Về lại trang đăng nhập
    }
}