package gr.hua.dit.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/login")
	public String showLogin(){
		return "home";
	}

	@RequestMapping("/home")
	public String showHome() {
		return "/home";
	}
}
