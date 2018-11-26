package com.book.service;

import java.util.List;

import com.book.core.web.service.BaseService;
import com.book.pojos.Course;

public interface CourseService extends BaseService<Course> {
	List<Course> findCourseByGradeAndMajor(String grade, String major);

	List<Course> findCourseByGradeMajorAndTerm(String grade, String major, int term);

	Course findCourseByNameGradeAndMajor(String name, String grade, String major);
}
