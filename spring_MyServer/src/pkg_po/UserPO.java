package pkg_po;
import java.io.Serializable;

public  class UserPO{
	private Integer employee_id;
	private String employee_name;
	private String employee_pwd;
	private String gender;
	private String phone;
	private String birthday;
	private String department;
	private String email;
	private String address;
	private String lever;

	public Integer getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(Integer employee_id) {
		this.employee_id = employee_id;
	}	
	public String getEmployee_pwd() {
		return employee_pwd;
	}
	public void setEmployee_pwd(String employee_pwd) {
		this.employee_pwd = employee_pwd;
	}
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public String getGender(){
		return gender;
	}	
	public void setGender(String gender){
		this.gender = gender;
	}	
	public String getPhone(){
		return phone;
	}	
	public void setPhone(String phone){
		this.phone = phone;
	}
	public String getBirthday(){
		return birthday;
	}	
	public void setBirthday(String birthday){
		this.birthday = birthday;
	}	
	public String getDepartment(){
		return department;
	}	
	public void setDepartment(String department){
		this.department = department;
	}	
	public String getEmail(){
		return email;
	}	
	public void setEmail(String email){
		this.email = email;
	}
	public String getAddress(){
		return address;
	}
	public void setAddress(String address){
		this.address = address;
	}
	public String getLever(){
		return lever;
	}
	public void setLever(String lever){
		this.lever = lever;
	}		
}
