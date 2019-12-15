package com.d2e.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.d2e.dao.StudentDAO;
import com.d2e.entity.Student;
import com.d2e.service.StudentService;

@Service
public class StudentServiceIMPL implements StudentService {

	@Autowired
	private StudentDAO studentDAO;
	
	@Override
	public List<Student> getAll() {
		return studentDAO.getAll();
	}

	@Override
	public Student getById(int id) {
		return studentDAO.getById(id);
	}

	@Override
	public void createStudent(Student student) {
		studentDAO.createStudent(student);
	}

	@Override
	public void updateStudent(Student student) {
		studentDAO.updateStudent(student);
	}

	@Override
	public void deleteStudent(Student student) {
		studentDAO.deleteStudent(student);
		
	}

}
