package ra.edu.ex5.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ra.edu.ex5.model.Employee;
import ra.edu.ex5.service.EmployeeService;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping
    public String listEmployees(HttpSession session, Model model) {
        if (session.getAttribute("loggedUser") == null) return "redirect:/login";

        model.addAttribute("employees", employeeService.getAll());
        model.addAttribute("totalTechSalary", employeeService.calculateTotalSalaryByDept("Kỹ thuật"));
        return "employees";
    }

    @GetMapping("/{code}")
    public String detailEmployee(@PathVariable("code") String code, HttpSession session, Model model) {
        if (session.getAttribute("loggedUser") == null) return "redirect:/login";

        Employee emp = employeeService.getByCode(code);
        if (emp == null) {
            throw new RuntimeException("Nhân viên [" + code + "] không tồn tại trong hệ thống.");
        }
        model.addAttribute("emp", emp);
        return "employee-detail";
    }
}