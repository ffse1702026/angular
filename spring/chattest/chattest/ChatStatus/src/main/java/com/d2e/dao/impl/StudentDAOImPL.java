package com.d2e.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.d2e.dao.StudentDAO;
import com.d2e.entity.Student;

@Repository
@Transactional
public class StudentDAOImPL implements StudentDAO{

	@Autowired
	private EntityManager entityManager;
	
	@Override
	public List<Student> getAll() {
		return entityManager.createQuery("FROM Student",Student.class).getResultList();
	}

	@Override
	public Student getById(int id) {
		return entityManager.find(Student.class,id);
	}

	@Override
	public void createStudent(Student student) {
		entityManager.persist(student);	
	}

	@Override
	public void updateStudent(Student student) {
		entityManager.merge(student);		
		
	}

	@Override
	public void deleteStudent(Student student) {
		entityManager.remove(student);
	}

}
