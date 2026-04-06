package ra.edu.ex5.service;

import org.springframework.stereotype.Service;
import ra.edu.ex5.model.Employee;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class EmployeeService {
    private List<Employee> employees;

    public EmployeeService() {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            employees = new ArrayList<>(Arrays.asList(
                    new Employee("NV001", "Nguyễn Thị Lan", "Kế toán", 15000000, sdf.parse("2020-03-01"), "Đang làm"),
                    new Employee("NV002", "Trần Văn Hùng", "Kỹ thuật", 25000000, sdf.parse("2019-07-15"), "Đang làm"),
                    new Employee("NV003", "Lê Minh Đức", "Kinh doanh", 18500000, sdf.parse("2021-11-20"), "Nghỉ phép"),
                    new Employee("NV004", "Phạm Thu Hương", "Kỹ thuật", 22000000, sdf.parse("2022-01-05"), "Đang làm"),
                    new Employee("NV005", "Hoàng Văn Nam", "Kế toán", 12000000, sdf.parse("2023-06-10"), "Thử việc")
            ));
        } catch (Exception e) { e.printStackTrace(); }
    }

    public List<Employee> getAll() { return employees; }

    public Employee getByCode(String code) {
        return employees.stream().filter(e -> e.getCode().equals(code)).findFirst().orElse(null);
    }

    public double calculateTotalSalaryByDept(String department) {
        return employees.stream()
                .filter(e -> e.getDepartment().equals(department))
                .mapToDouble(Employee::getSalary).sum();
    }
}