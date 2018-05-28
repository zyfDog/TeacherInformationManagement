package edu.cqut.hr.service;

import java.util.List;
import java.util.Map;

import edu.cqut.hr.model.Teacher;

public interface TeacherService {
	
	public void  addTeacher(Teacher T) throws Exception;
	
	public void deleteTeacher(Integer id) throws Exception;

	public void updateTeacher(Teacher T) throws Exception;
	
	public List<Teacher> queryAll() throws Exception;
	
	public Teacher get(Integer id) throws Exception;
	
	public List<Teacher> query(List<Map<String, Object>> params) throws Exception;
	
}
