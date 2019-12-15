package com.d2e.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.d2e.entity.Student;
import com.d2e.service.StudentService;

@Controller
@RequestMapping(value="/student")
public class CrudStudentController {
//	protected Logger logger = Logger.getLogger(this.getClass());																			

	@Autowired
    MessageSource messageSource;
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value="/list",method= RequestMethod.GET)
	public String index(ModelMap model, HttpServletRequest request) throws Exception {
		/*
		 * LocaleResolver localeResolver =
		 * RequestContextUtils.getLocaleResolver(request);
		 * System.out.println(localeResolver); Locale locale =
		 * localeResolver.resolveLocale(request); System.out.println(locale);
		 * System.out.println(request.getLocale());
		 */
		model.put("listStudent", studentService.getAll());


	return "student/index";
	}
	
	@RequestMapping(value="/create",method= RequestMethod.GET)
	public String create(ModelMap model) {
		model.put("student", new Student());
		model.put("action", "create");
		return "student/form";
	}
	
	@RequestMapping(value="/create",method= RequestMethod.POST)
	public String create(Student student) {
		studentService.createStudent(student);
		return "redirect:list";
	}
	
	@RequestMapping(value="/update/{id}",method= RequestMethod.GET )
	public String update(ModelMap model,@PathVariable("id") int id) {
		model.put("student", studentService.getById(id));
		model.put("action", "update");
		return "student/form";
	}
	
	@RequestMapping(value="/update",method= RequestMethod.POST)
	public String update(Student student) {
		studentService.updateStudent(student);
		return "redirect:list";
	}
	
	@RequestMapping(value="/delete/{id}",method= RequestMethod.GET )
	public String delete(ModelMap model,@PathVariable("id") int id) {
		studentService.deleteStudent(studentService.getById(id));
		return "redirect:/student/list";
	}

}
