package com.book.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.book.core.web.dao.impl.BaseDaoImpl;
import com.book.dao.CourseDao;
import com.book.pojos.Course;

@Repository(value = "courseDao")
@SuppressWarnings("unchecked")
public class CourseDaoImpl extends BaseDaoImpl<Course> implements CourseDao {

	@Override
	public List<Course> findCourseByGradeMajorAndTerm(String grade, String major, int term) {
		String hql = "from Course c where c.grade = ? and c.major = ? and term = ?";
		return (List<Course>) this.getHibernateTemplate().find(hql, grade, major, term);
	}

	@Override
	public List<Course> findCourseByGradeAndMajor(String grade, String major) {
		String hql = "from Course c where c.grade = ? and c.major = ?";
		return (List<Course>) this.getHibernateTemplate().find(hql, grade, major);
	}

	@Override
	public Course findCourseByNameGradeAndMajor(String name, String grade, String major) {
		String hql = "from Course c where c.name like ? and c.grade = ? and c.major = ?";
		List<Course> courses = (List<Course>) this.getHibernateTemplate().find(hql, "%" + name + "%", grade, major);
		if (courses == null || courses.isEmpty())
			return null;
		return courses.get(0);
	}
}
