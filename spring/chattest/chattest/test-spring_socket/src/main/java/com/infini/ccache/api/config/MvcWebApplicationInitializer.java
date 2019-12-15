//package com.infini.ccache.api.config;
//
//import javax.servlet.Filter;
//
//import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
//
//import com.infini.ccache.api.filter.RequestURIOverriderServletFilter;
//
//public class MvcWebApplicationInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
//
//	@Override
//	  protected Filter[] getServletFilters() {
//	    return new Filter[] { new RequestURIOverriderServletFilter()};
//	  }
//
//	@Override
//	protected Class<?>[] getRootConfigClasses() {
//		return new Class[] { WebSecurityConfig.class };
//	}
//
//	@Override
//	protected Class<?>[] getServletConfigClasses() {
//	    return new Class[] { WebConfig.class };
//	}
//
//	@Override
//	protected String[] getServletMappings() {
//		return new String[] { "/" };
//	}
//}
