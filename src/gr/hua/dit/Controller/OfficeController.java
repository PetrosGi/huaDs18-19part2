package gr.hua.dit.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gr.hua.dit.Service.OfficeService;
import gr.hua.dit.entity.Corp;
import gr.hua.dit.entity.Student;
import gr.hua.dit.entity.User;

@Controller
@RequestMapping("/office")
public class OfficeController {

	@Autowired
	private OfficeService officeService;

	@RequestMapping("/listStudents")
	public String getStudents(Model model) {

		List<Student> list = officeService.getStudents();
		model.addAttribute("student", list);
		return "listStudents";
	}

	@RequestMapping("/checkStudent")
	public String deleteUser(@RequestParam("sid") int studentId, Model model) {

		Student student = officeService.getStudentsBySId(studentId);
		model.addAttribute("student", student);
		return "/studentInfo";
	}

	@RequestMapping("/studentDelete")
	public String deleteStudent(@RequestParam("studentId") int studentId) {

		Student student = findSById(studentId);
		officeService.deleteStudent(student);
		return "redirect:/ds/listStudents";
	}

	private Student findSById(int studentId) {
		Student student = officeService.getStudentById(studentId);
		return student;
	}

	@RequestMapping("/listCorps")
	public String getCorps(Model model) {

		List<Corp> list = officeService.getCorps();
		model.addAttribute("corp", list);
		return "listCorps";
	}

	@RequestMapping("/corpDelete")
	public String deleteCorp(@RequestParam("corpId") int corpId) {

		Corp corp = findCById(corpId);
		officeService.deleteCorp(corp);
		return "redirect:/listCorps";
	}

	private Corp findCById(int corpId) {
		Corp corp = officeService.getCorpById(corpId);
		return corp;
	}

	@RequestMapping(value = "changeStudent")
	public String changeStudent(@RequestParam("sid") int sid, @RequestParam("status1") String status1,
			@RequestParam("status2") String status2, @RequestParam("status3") String status3) {

		Student student = officeService.getStudentsBySId(sid);
		student.setStatus1(status1);
		student.setStatus2(status2);
		student.setStatus3(status3);

		officeService.updateStudent(student);
		return "redirect:listStudents";
	}

	@RequestMapping("checkC")
	public String getCorp(@RequestParam("id") int id, Model model) {

		Corp corp = officeService.getCorpById(id);
		model.addAttribute(corp);

		return "checkCorp";
	}

}
