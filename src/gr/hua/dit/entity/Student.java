package gr.hua.dit.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "student")
public class Student {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "sid")
	private int sid;

	@Column(name = "first_name")
	private String first_name;

	@Column(name = "last_name")
	private String last_name;

	@Column(name = "email")
	private String email;

	@Column(name = "registration_year")
	private int registration_year;

	@Column(name = "remaining_classes")
	private int remaining_classes;

	@Column(name = "petition1")
	private String petition1;

	@Column(name = "petition2")
	private String petition2;

	@Column(name = "petition3")
	private String petition3;

	@Column(name = "dest1")
	private String dest1;

	@Column(name = "dest2")
	private String dest2;

	@Column(name = "dest3")
	private String dest3;

	@Column(name = "status1")
	private String status1;

	@Column(name = "status2")
	private String status2;

	@Column(name = "status3")
	private String status3;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getRegistration_year() {
		return registration_year;
	}

	public void setRegistration_year(int registration_year) {
		this.registration_year = registration_year;
	}

	public int getRemaining_classes() {
		return remaining_classes;
	}

	public void setRemaining_classes(int remaining_classes) {
		this.remaining_classes = remaining_classes;
	}

	public String getPetition1() {
		return petition1;
	}

	public void setPetition1(String petition1) {
		this.petition1 = petition1;
	}

	public String getPetition2() {
		return petition2;
	}

	public void setPetition2(String petition2) {
		this.petition2 = petition2;
	}

	public String getPetition3() {
		return petition3;
	}

	public void setPetition3(String petition3) {
		this.petition3 = petition3;
	}

	public String getDest1() {
		return dest1;
	}

	public void setDest1(String dest1) {
		this.dest1 = dest1;
	}

	public String getDest2() {
		return dest2;
	}

	public void setDest2(String dest2) {
		this.dest2 = dest2;
	}

	public String getDest3() {
		return dest3;
	}

	public void setDest3(String dest3) {
		this.dest3 = dest3;
	}

	public String getStatus1() {
		return status1;
	}

	public void setStatus1(String status1) {
		this.status1 = status1;
	}

	public String getStatus2() {
		return status2;
	}

	public void setStatus2(String status2) {
		this.status2 = status2;
	}

	public String getStatus3() {
		return status3;
	}

	public void setStatus3(String status3) {
		this.status3 = status3;
	}

}
