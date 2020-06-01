package com.alexdft.libraryservice.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private DataSource securityDataSource;

    @Autowired
    public SecurityConfig(DataSource securityDataSource) {
        this.securityDataSource=securityDataSource;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(securityDataSource);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/").hasRole("User")
                .antMatchers("/bookList").hasRole("User")
                .antMatchers("/addScore").hasRole("User")
                .antMatchers("/deleteScore").hasRole("User")
                .antMatchers("/adminPanel").hasRole("Admin")
                .antMatchers("/addForm").hasRole("Admin")
                .antMatchers("/updateForm").hasRole("Admin")
                .antMatchers("/saveBook").hasRole("Admin")
                .antMatchers("/deleteBook").hasRole("Admin")
                .and().formLogin().loginPage("/login").loginProcessingUrl("/auth").permitAll()
                .and().logout().permitAll()
                .and().exceptionHandling().accessDeniedPage("/accessDenied");
    }
}