//package com.infini.ccache.api.config;
//
//import org.springframework.context.annotation.ComponentScan;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//
//@Configuration
//@EnableWebSecurity
//@ComponentScan(basePackages = { "com.infini.ccache.api" })
//public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
//
//	@Override
//	  protected void configure(HttpSecurity http) throws Exception {
//	    http
//	      .headers().frameOptions().sameOrigin().httpStrictTransportSecurity().disable()
//	      .and()
//	      .authorizeRequests()
//	      .antMatchers("/").permitAll()
//	      .antMatchers("/downloadTestFile/abc3.zip").permitAll();
//	  }
//}
