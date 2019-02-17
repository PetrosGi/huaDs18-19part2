package gr.hua.dit.Service;

import java.util.List;

import gr.hua.dit.entity.Corp;
import gr.hua.dit.entity.Student;

public interface OfficeService {

	List<Student> getStudents();

	void deleteStudent(Student student);

	Student getStudentById(int studentId);

	List<Corp> getCorps();

	void deleteCorp(Corp corp);

	Corp getCorpById(int corpId);

	Student getStudentsBySId(int studentId);

	void saveCorpService(Corp corp);

	void updateStudent(Student student);

}
