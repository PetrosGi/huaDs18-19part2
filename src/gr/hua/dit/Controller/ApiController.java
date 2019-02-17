package gr.hua.dit.Controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gr.hua.dit.Service.OfficeService;
import gr.hua.dit.entity.Corp;
import gr.hua.dit.entity.Student;

@Controller
@RequestMapping("/api")
public class ApiController {

	@Autowired
	private OfficeService officeService;

	@RequestMapping(value = "/studentTest/{studentId}", method = RequestMethod.GET)
	public String stt(@PathVariable int studentId, ModelMap model, Principal principal) throws SecurityException {

		Integer test = studentId;

		if (!principal.getName().equals(test.toString())) {
			return "error";
		}

		Student student = officeService.getStudentsBySId(studentId);
		model.addAttribute("student", student);
		return "studentHome";
	}

	@RequestMapping(value = "/addcorp", method = RequestMethod.POST, produces = { "application/json; charset=UTF-8" })
	public String addCorp(@RequestParam("cname") String cname, @RequestParam("email") String email,
			@RequestParam("petition") String petition) {

		Corp corp = new Corp();
		corp.setName(cname);
		corp.setEmail(email);
		corp.setPetition(petition);
		officeService.saveCorpService(corp);
		return "redirect:/home";

	}

	@RequestMapping(value = "/studentP/{studentId}", method = RequestMethod.GET)
	public String goToPetition(@PathVariable int studentId, ModelMap model, Principal principal) {

		Integer test = studentId;

		if (!principal.getName().equals(test.toString())) {
			return "error";
		}

		Student student = officeService.getStudentsBySId(studentId);
		model.addAttribute("student", student);
		return "studentPetition";
	}

	@RequestMapping(value = "/{pathURL}/addPetition", method = RequestMethod.POST, produces = {
			"application/json; charset=UTF-8" })
	public String addPetition(@RequestParam("sid") int sid, @RequestParam("dest") String dest,
			@RequestParam("pett") String petition) {

		Student student = officeService.getStudentsBySId(sid);
		if (!(student.getPetition1() == null)) {
			if (student.getPetition2() == null) {
				student.setPetition2(petition);
				student.setDest2(dest);
			} else {
				student.setPetition3(petition);
				student.setDest3(dest);
			}
		} else {
			student.setPetition1(petition);
			student.setDest1(dest);
		}

		officeService.updateStudent(student);
		return "redirect:/api/studentTest/" + sid;
	}

}
