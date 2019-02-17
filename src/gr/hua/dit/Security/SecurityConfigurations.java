package gr.hua.dit.Security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;


@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)
public class SecurityConfigurations extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;
	
	
	@Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    

		auth.jdbcAuthentication().dataSource(dataSource)
        .passwordEncoder(passwordEncoder())
           .usersByUsernameQuery(
            "select username,password, enabled from user where username=?")
           .authoritiesByUsernameQuery(
            "select username, authority from authorities where username=?");
    }
	

    @Override
    protected void configure(HttpSecurity http) throws Exception {
            http
            .csrf().disable()
            .authorizeRequests()
//            .antMatchers("/home").permitAll()
 //           .antMatchers("/login").permitAll()	
//            .antMatchers("/login").anonymous()
//            .antMatchers("/api/addCorp").permitAll()
        
            .antMatchers("/office/**").access("hasRole('ROLE_OFFICE')")
            .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
            .antMatchers("/api/studentTest/**","/api/studentP/**","/api/**/addPetition").access("hasRole('ROLE_USER')")
            .and()
            .formLogin().loginPage("/login")
            .loginProcessingUrl("/authUser")
            .successHandler(myAuthenticationSuccessHandler())
            .permitAll()
            .and()
            .logout()
            .logoutUrl("/logout").logoutSuccessUrl("/home")
            .invalidateHttpSession(true)
            .deleteCookies("JSESSIONID");
            
            CharacterEncodingFilter filter = new CharacterEncodingFilter();
            filter.setEncoding("UTF-8");
            filter.setForceEncoding(true);
            http.addFilterBefore(filter, CsrfFilter.class);
            
            http.sessionManagement()
            .sessionCreationPolicy(SessionCreationPolicy.ALWAYS);
    }
    
    @Override
    public void configure(WebSecurity web) throws Exception {
             web.ignoring()
            .antMatchers("/resources/**")
         .antMatchers("/home")
//  //          .antMatchers("/login")
         .antMatchers("/api/addCorp");
    }
    
    @Bean
	public PasswordEncoder passwordEncoder() {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
}
    
    @Bean("authenticationManager")
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
            return super.authenticationManagerBean();
    }
    
    @Bean
    public AuthenticationSuccessHandler myAuthenticationSuccessHandler(){
        return new MySimpleUrlAuthenticationSuccessHandler();
    }
}
