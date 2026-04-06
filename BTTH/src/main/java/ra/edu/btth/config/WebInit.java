package ra.edu.btth.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebInit extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[0];
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{WebConfig.class}; // Nạp file cấu hình ở trên vào đây
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"}; // Bắt mọi đường dẫn link
    }
}