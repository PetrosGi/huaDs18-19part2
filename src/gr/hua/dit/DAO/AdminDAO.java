package gr.hua.dit.DAO;

import java.util.List;

import gr.hua.dit.entity.Authorities;
import gr.hua.dit.entity.User;

public interface AdminDAO {

	public void saveUserDAO(User userObj);
	
	public List<User> getUsers();

	public User getUserById(String userId);

	public void deleteUser(User user);

	public void saveAuth(Authorities auth);

	
}
