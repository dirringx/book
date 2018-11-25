package com.book.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.book.core.web.service.impl.BaseServiceImpl;
import com.book.dao.CourseDao;
import com.book.pojos.Course;
import com.book.service.CourseService;

@Service(value = "courseService")
public class CourseServiceImpl extends BaseServiceImpl<Course> implements CourseService {

	@Resource(name = "courseDao")
	private CourseDao courseDao;

	@Override
	public List<Course> findCourseByGradeMajorAndTerm(String grade, String major, int term) {
		return courseDao.findCourseByGradeMajorAndTerm(grade, major, term);
	}

	@Override
	public List<Course> findCourseByGradeAndMajor(String grade, String major) {
		return courseDao.findCourseByGradeAndMajor(grade, major);
	}

	@Override
	public Course findCourseByNameGradeAndMajor(String name, String grade, String major) {
		return courseDao.findCourseByNameGradeAndMajor(name, grade, major);
	}

}
