package com.book.dao;

import java.util.List;

import com.book.core.web.dao.BaseDao;
import com.book.pojos.Course;

public interface CourseDao extends BaseDao<Course> {

	List<Course> findCourseByGradeAndMajor(String grade, String major);

	List<Course> findCourseByGradeMajorAndTerm(String grade, String major, int term);

	Course findCourseByNameGradeAndMajor(String name, String grade, String major);
}
