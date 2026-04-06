package ra.edu.btth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudentCardController {

    @GetMapping("/student-card")
    public String showStudentCard(
            @RequestParam(value = "msv", required = false) String msv,
            Model model) {

        // Nếu chưa nhập mã SV
        if (msv == null || msv.trim().isEmpty()) {
            model.addAttribute("errorMessage", "Vui lòng nhập tham số msv trên URL.");
            return "student-card";
        }

        // Logic tìm kiếm sinh viên bằng if-else
        if ("SV001".equals(msv)) {
            model.addAttribute("msv", msv);
            model.addAttribute("studentName", "Nguyễn Văn An");
            model.addAttribute("faculty", "Công nghệ thông tin");
            model.addAttribute("year", 3);
            model.addAttribute("gpa", 8.5);
        } else if ("SV002".equals(msv)) {
            model.addAttribute("msv", msv);
            model.addAttribute("studentName", "Trần Thị Bình");
            model.addAttribute("faculty", "Kinh tế");
            model.addAttribute("year", 2);
            model.addAttribute("gpa", 7.2);
        } else if ("SV003".equals(msv)) {
            model.addAttribute("msv", msv);
            model.addAttribute("studentName", "Lê Minh Cường");
            model.addAttribute("faculty", "Công nghệ thông tin");
            model.addAttribute("year", 4);
            model.addAttribute("gpa", 3.8);
        } else {
            // Không tìm thấy
            model.addAttribute("errorMessage", "Không tìm thấy sinh viên với mã " + msv);
        }

        return "student-card";
    }
}
