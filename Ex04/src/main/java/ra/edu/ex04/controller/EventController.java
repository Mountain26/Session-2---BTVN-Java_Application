package ra.edu.ex04.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ra.edu.ex04.model.Event;

import java.util.ArrayList;
import java.util.List;

@Controller
public class EventController {

    @GetMapping({"/", "/events"})
    public String goToSearch() {
        return "redirect:/events/search";
    }

    @GetMapping("/events/search")
    public String searchEvents(
            @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
            Model model) {

        // 1. Tạo danh sách sự kiện giả lập
        List<Event> allEvents = new ArrayList<>();
        allEvents.add(new Event("EV01", "Nhạc hội Spring Framework", "20/11/2026", 0, 150));
        allEvents.add(new Event("EV02", "Hội thảo Java Web", "25/11/2026", 500000, 5));
        allEvents.add(new Event("EV03", "Đêm nhạc Trịnh", "01/12/2026", 1200000, 0));
        allEvents.add(new Event("EV04", "Sự kiện <b>Hackers</b>", "15/12/2026", 0, 0));

        // 2. Xử lý logic lọc theo từ khóa (không phân biệt hoa thường)
        List<Event> filteredEvents = new ArrayList<>();
        if (keyword.trim().isEmpty()) {
            filteredEvents = allEvents; // Rỗng thì lấy tất cả
        } else {
            for (Event e : allEvents) {
                if (e.getName().toLowerCase().contains(keyword.toLowerCase())) {
                    filteredEvents.add(e);
                }
            }
        }

        // 3. Đẩy dữ liệu ra giao diện
        model.addAttribute("events", filteredEvents);
        model.addAttribute("keyword", keyword);

        // Trả về file events.jsp nằm trong thư mục views/
        return "events";
    }

    @GetMapping("/events/{id}/book")
    public String bookEvent(@PathVariable("id") String id, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("message", "Da tiep nhan yeu cau dat ve cho su kien: " + id);
        return "redirect:/events/search";
    }
}