package com.infini.b2e.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.InMemoryTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    @Qualifier("authenticationProvider")
    AuthenticationProvider authenticationProvider;

    @Autowired
    UserDetailsService userDetailsService;

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();
        // The pages does not require login
        http.authorizeRequests().antMatchers("/", "/login", "/logout", "/airport", "/corporate", "/carrier" , "/holiday").permitAll();
        // If no login, it will redirect to /login page.
        http.authorizeRequests().antMatchers("/inf_admin/**","/corporate/**").access("hasAnyRole('ROLE_USER')");
        // AccessDeniedException will be thrown.
        http.authorizeRequests().antMatchers("/*").denyAll();
        http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
        // Config for Login Form
        http.authorizeRequests()
                // Submit URL of login page.
                .and().formLogin()//
                .loginProcessingUrl("/j_spring_security_check") // Submit URL
                .loginPage("/login")//
                .defaultSuccessUrl("/inf_admin/menu")//
                .failureUrl("/login?error=true")//
                .usernameParameter("Username")//
                .passwordParameter("Password")
                // Config for Logout Page
                .and().logout().logoutUrl("/logout").invalidateHttpSession(true).logoutSuccessUrl("/login");
        // config Remember Me.
        http.authorizeRequests().and() //
                .rememberMe().tokenRepository(this.persistentTokenRepository()) //
                .tokenValiditySeconds(1 * 24 * 60 * 60); // 24h
    }

    @Bean
    public PersistentTokenRepository persistentTokenRepository() {
        InMemoryTokenRepositoryImpl memory = new InMemoryTokenRepositoryImpl();
        return memory;
    }

    public class PasswordEnconderTest implements PasswordEncoder {
        @Override
        public String encode(CharSequence charSequence) {
            return charSequence.toString();
        }

        @Override
        public boolean matches(CharSequence charSequence, String s) {
            return charSequence.toString().equals(s);
        }
    }
}
