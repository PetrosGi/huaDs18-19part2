package gr.hua.dit.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gr.hua.dit.entity.Corp;
import gr.hua.dit.entity.Student;
import gr.hua.dit.entity.User;

@Repository
public class OfficeDAOImpl implements OfficeDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Student> getStudents() {
		Session currentSession = sessionFactory.getCurrentSession();

		Query<Student> query = currentSession.createQuery("from Student", Student.class);

		List<Student> students = query.getResultList();

		return students;
	}

	@Override
	public void deleteStudent(Student student) {
		sessionFactory.getCurrentSession().delete(student);
	}

	@Override
	public Student getStudentByID(int studentId) {
		Student student = (Student) sessionFactory.getCurrentSession().get(Student.class, studentId);
		return student;
	}

	@Override
	public Student getStudentsBySId(int studentId) {
		Student r = new Student();
		Session currentSession = sessionFactory.getCurrentSession();

		Query<Student> query = currentSession.createQuery("from Student", Student.class);

		List<Student> students = query.getResultList();

		for (Student s : students) {
			if (s.getSid() == studentId) {
				r = s;
			}
		}

		if (r.getSid() != studentId) {
			throw new IllegalArgumentException("Error");
		}

		return r;
	}

	@Override
	public List<Corp> getCorps() {
		Session currentSession = sessionFactory.getCurrentSession();

		Query<Corp> query = currentSession.createQuery("from Corp", Corp.class);

		List<Corp> corps = query.getResultList();

		return corps;
	}

	@Override
	public void deleteCorp(Corp corp) {
		sessionFactory.getCurrentSession().delete(corp);
	}

	@Override
	public Corp getCorpByID(int corpId) {
		Corp corp = (Corp) sessionFactory.getCurrentSession().get(Corp.class, corpId);
		return corp;
	}

	@Override
	public void saveCorpDAO(Corp corp) {
		System.out.println("dao___________" + corp.getName());// test print
		sessionFactory.getCurrentSession().saveOrUpdate(corp);

	}

	@Override
	public void updateStudent(Student student) {
		System.out.println("dao___________");// test print
		sessionFactory.getCurrentSession().update(student);
	}

}
