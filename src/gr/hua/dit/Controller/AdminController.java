package gr.hua.dit.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gr.hua.dit.Service.AdminService;
import gr.hua.dit.Service.AdminServiceImpl;
import gr.hua.dit.entity.Authorities;
import gr.hua.dit.entity.User;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	PasswordEncoder hs = new BCryptPasswordEncoder(4);

	@RequestMapping("/adminIndex")
	public String showAdminIndex() {

		return "/adminIndex";
	}

	@RequestMapping("/adminUserAdd")
	public String showAdminUserAdd(Model model) {
		User user = new User();

		model.addAttribute("user", user);
		return "adminUserAdd";
	}

	@RequestMapping("/adminUserAddG")
	public String showAdminUserAddG(Model model) {
		User user = new User();

		model.addAttribute("user", user);
		return "adminUserAddG";
	}

	@RequestMapping("/addUser")
	public String addUser(@ModelAttribute("user") User user, Model model) {

		user.setPassword(hs.encode(user.getPassword()));
		adminService.saveUserService(user);
		List<User> list = adminService.getUsers();
		model.addAttribute("user", list);
		return "listUsers";
	}

	@RequestMapping("/addUserG")
	public String addUserG(@ModelAttribute("user") User user, Model model) {

		user.setPassword(hs.encode(user.getPassword()));
		adminService.saveUserService(user);
		List<User> list = adminService.getUsers();
		model.addAttribute("user", list);
		return "listUsersG";
	}

	@RequestMapping("/listUsers")
	public String getUsers(Model model) {

		List<User> list = adminService.getUsers();
		model.addAttribute("user", list);
		return "listUsers";
	}

	@RequestMapping("/listUsersG")
	public String getUsersG(Model model) {

		List<User> list = adminService.getUsers();
		model.addAttribute("user", list);
		return "listUsersG";
	}

	@RequestMapping("/adminUserEdit")
	public String showAdminUserEdit(@RequestParam("uId") String userId, Model model) {

		User user = findById(userId);
		model.addAttribute("user", user);
		return "adminUserAdd";
	}

	@RequestMapping("/adminUserEditG")
	public String showAdminUserEditG(@RequestParam("uId") String userId, Model model) {

		User user = findById(userId);
		model.addAttribute("user", user);
		return "adminUserAddG";
	}

	@RequestMapping("/userDelete")
	public String deleteUser(@RequestParam("uId") String userId) {

		User user = findById(userId);
		adminService.deleteUser(user);
		return "redirect:/admin/listUsers";
	}

	@RequestMapping("/userDeleteG")
	public String deleteUserG(@RequestParam("uId") String userId) {

		User user = findById(userId);
		adminService.deleteUser(user);
		return "redirect:/admin/listUsersG";
	}

	private User findById(String userId) {
		User user = adminService.getUserById(userId);
		return user;
	}

	@RequestMapping("/adminSetAuth")
	public String setAuthority(Authorities auth) {

		adminService.saveAuth(auth);
		return "redirect:/admin/listUsers";
	}

	@RequestMapping("/adminSetAuthG")
	public String setAuthorityG(Authorities auth) {

		adminService.saveAuth(auth);
		return "redirect:/admin/listUsersG";
	}

	@RequestMapping("/addAuth")
	public String showAddAuth(@RequestParam("uId") String userId, Model model) {
		Authorities auth = new Authorities();
		auth.setUsername(userId);
		model.addAttribute("auth", auth);
		return "addAuth";
	}

	@RequestMapping("/addAuthG")
	public String showAddAuthG(@RequestParam("uId") String userId, Model model) {
		Authorities auth = new Authorities();
		auth.setUsername(userId);
		model.addAttribute("auth", auth);
		return "addAuthG";
	}
}
