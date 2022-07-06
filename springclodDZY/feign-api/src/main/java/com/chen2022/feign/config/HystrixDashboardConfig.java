//package com.chen2022.feign.config;
//
//import com.netflix.hystrix.contrib.metrics.eventstream.HystrixMetricsStreamServlet;
//import org.springframework.boot.web.servlet.ServletRegistrationBean;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//@Configuration
//public class HystrixDashboardConfig {
//
//    @Bean
//    public ServletRegistrationBean getServlet(){
//        HystrixMetricsStreamServlet hmss = new HystrixMetricsStreamServlet();
//
//        ServletRegistrationBean srBean = new ServletRegistrationBean(hmss);
//
//        srBean.setLoadOnStartup(1);
//
//        srBean.addUrlMappings("/hystrix.stream");
//
//        srBean.setName("HystrixMetricsStreamServlet");
//
//        return srBean;
//    }
//}
