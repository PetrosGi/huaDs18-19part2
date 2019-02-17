package gr.hua.dit.Service;

import java.util.List;

import gr.hua.dit.entity.Authorities;
import gr.hua.dit.entity.User;

public interface AdminService {

	public void saveUserService(User user);

	public List<User> getUsers();

	public User getUserById(String userId);

	public void deleteUser(User user);

	public void saveAuth(Authorities auth);

}
