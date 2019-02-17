package gr.hua.dit.DAO;

import java.util.List;

import gr.hua.dit.entity.Corp;
import gr.hua.dit.entity.Student;

public interface OfficeDAO {

	List<Student> getStudents();

	void deleteStudent(Student student);

	Student getStudentByID(int studentId);

	List<Corp> getCorps();

	void deleteCorp(Corp corp);

	Corp getCorpByID(int corpId);

	Student getStudentsBySId(int studentId);

	void saveCorpDAO(Corp corp);

	void updateStudent(Student student);

}
