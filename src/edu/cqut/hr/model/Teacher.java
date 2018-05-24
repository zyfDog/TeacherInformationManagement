package edu.cqut.hr.model;

import java.util.Date;

public class Teacher {
	private Integer id;
	private String name;
	private String sex;
	private Date birthday;
	private Float salary;
	private String college;
	private String major;

	public Teacher() {

	}

	public Teacher(Integer id, String name, String sex, Date birthday, Float salary, String college, String major) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.birthday = birthday;
		this.salary = salary;
		this.college = college;
		this.major = major;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Float getSalary() {
		return salary;
	}

	public void setSalary(Float salary) {
		this.salary = salary;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	@Override
	public String toString() {
		return "Teacher [id=" + id + ", name=" + name + ", sex=" + sex + ", birthday=" + birthday + ", salary=" + salary
				+ ", college=" + college + ", major=" + major + "]";
	}
	
	

}
