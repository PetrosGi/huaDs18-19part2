package gr.hua.dit.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gr.hua.dit.DAO.OfficeDAO;
import gr.hua.dit.entity.Corp;
import gr.hua.dit.entity.Student;

@Service
public class OfficeServiceImp implements OfficeService {

	@Autowired
	private OfficeDAO officeDAO;

	@Override
	@Transactional
	public List<Student> getStudents() {
		return officeDAO.getStudents();
	}

	@Override
	@Transactional
	public void deleteStudent(Student student) {
		officeDAO.deleteStudent(student);
	}

	@Override
	@Transactional
	public Student getStudentById(int studentId) {
		return officeDAO.getStudentByID(studentId);
	}

	@Override
	@Transactional
	public List<Corp> getCorps() {
		return officeDAO.getCorps();
	}

	@Override
	@Transactional
	public void deleteCorp(Corp corp) {
		officeDAO.deleteCorp(corp);
	}

	@Override
	@Transactional
	public Corp getCorpById(int corpId) {
		return officeDAO.getCorpByID(corpId);
	}

	@Override
	@Transactional
	public Student getStudentsBySId(int studentId) {

		return officeDAO.getStudentsBySId(studentId);
	}

	@Override
	@Transactional
	public void saveCorpService(Corp corp) {
		officeDAO.saveCorpDAO(corp);

	}

	@Override
	@Transactional
	public void updateStudent(Student student) {
		officeDAO.updateStudent(student);

	}
}
