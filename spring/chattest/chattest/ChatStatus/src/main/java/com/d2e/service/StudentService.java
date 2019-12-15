package com.d2e.service;

import java.util.List;

import com.d2e.entity.Student;


public interface StudentService {
	public List<Student> getAll();
	public Student getById(int id);
	public void createStudent(Student student);
	public void updateStudent(Student student);
	public void deleteStudent(Student student);
}
