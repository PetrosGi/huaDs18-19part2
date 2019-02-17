package gr.hua.dit.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gr.hua.dit.entity.Authorities;
import gr.hua.dit.entity.User;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveUserDAO(User user) {
		sessionFactory.getCurrentSession().saveOrUpdate(user);
	}

	@Override
	public List<User> getUsers() {

		Session currentSession = sessionFactory.getCurrentSession();

		Query<User> query = currentSession.createQuery("from User", User.class);

		List<User> users = query.getResultList();

		return users;
	}

	@Override
	public User getUserById(String userId) {
		User user = (User) sessionFactory.getCurrentSession().get(User.class, userId);

		System.out.println(" user got by id " + user.getUsername());
		return user;
	}

	@Override
	public void deleteUser(User user) {

		System.out.println("delete " + user.getUsername());
		sessionFactory.getCurrentSession().delete(user);
	}

	@Override
	public void saveAuth(Authorities auth) {
		sessionFactory.getCurrentSession().saveOrUpdate(auth);
	}

}
