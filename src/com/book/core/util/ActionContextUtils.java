package com.book.core.util;

import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.opensymphony.xwork2.ActionContext;

/**
 * 处理ActionContext中的关于request,session,application等范围对象中的方法。
 */
public final class ActionContextUtils {

	private ActionContextUtils() {
	}

	/**
	 * HttpServletRequest对象对应的键。
	 */
	public static final String HTTP_REQUEST = "com.opensymphony.xwork2.dispatcher.HttpServletRequest";
	/**
	 * HttpServletResponse对象对应的键。
	 */
	public static final String HTTP_RESPONSE = "com.opensymphony.xwork2.dispatcher.HttpServletResponse";
	/**
	 * ServletContext对象对应的键。
	 */
	public static final String SERVLET_CONTEXT = "com.opensymphony.xwork2.dispatcher.ServletContext";

	/**
	 * 获取ActionContext对象。
	 * 
	 * @return ActionContext对象
	 */
	public static ActionContext getContext() {
		return ActionContext.getContext();
	}

	/**
	 * 获取指定的键所对应的对象的值 。<br>
	 * 对应HttpServletRequest对象中的request.getParameterMap()方法。
	 * 
	 * @param key
	 *            指定的键
	 * @return 指定的键所映射到的值
	 */

	public static String[] getParameters(String key) {
		String[] result = null;
		// 获取parameterMap中的数据,值都是String[]类型的
		Map params = getContext().getParameters();
		// 根据key获取值数组
		result = (String[]) params.get(key);
		if (result == null) {
			result = new String[1];
			result[0] = "";
		}
		return result;
	}

	/**
	 * 获取指定的键所对应的对象的值 的第一个字符串。<br>
	 * 对应HttpServletRequest对象中的request.getParameterMap()方法。
	 * 
	 * @param key
	 *            指定的键
	 * @return 指定的键所映射到的值的第一个字符串
	 */

	public static String getParameter(String key) {
		String[] result = null;
		// 获取parameterMap中的数据,值都是String[]类型的
		Map params = getContext().getParameters();
		// 根据key获取值数组
		result = (String[]) params.get(key);
		if (result == null) {
			result = new String[1];
			result[0] = "";
		}
		return result[0];
	}

	/**
	 * 从指定的对象范围中获取指定的键所对应的对象，并返回该对象的值。<br/>
	 * 如果指定的对象范围内不包含指定键的任何映射，则返回{@code NULL}。<br/>
	 * 该方法对应对象范围的getAttribute()方法。
	 * 
	 * @param scopeName
	 *            对象范围的名称 （request,session,application）
	 * @param key
	 *            指定的键
	 * @return 指定的键所映射到的值
	 */

	public static Object getAttribute(String key, String scopeName) {
		if (StringUtils.isEmpty(scopeName)) {
			scopeName = "session";
		}
		if (!"request".equals(scopeName) && !"session".equals(scopeName) && !"application".equals(scopeName)) {
			throw new RuntimeException("scopeName的值只能是request或session或application!");
		}
		Map map = (Map) getContext().get(scopeName);
		return map.get(key);
	}

	/**
	 * 将对象保存在request中，对应setAttribute()方法。
	 * 
	 * @param key
	 *            对象标识（键）
	 * @param value
	 *            保存对象
	 */

	public static void setAtrributeToRequest(String key, Object value) {
		// 返回request对象
		Map map = (Map) getContext().get("request");
		map.put(key, value);
	}

	/**
	 * 将对象保存在session中，对应setAttribute()方法。
	 * 
	 * @param key
	 *            对象标识
	 * @param value
	 *            保存对象
	 */

	public static void setAttributeToSession(String key, Object value) {
		// 返回session对象
		Map map = (Map) getContext().getSession();
		map.put(key, value);
	}

	/**
	 * 将对象保存在application中，对应ServletContext的setAttribute()方法。
	 * 
	 * @param key
	 *            对象标识
	 * @param value
	 *            保存对象
	 */

	public static void setAttributeToApplication(String key, Object value) {
		// 返回application对象
		Map map = (Map) getContext().getApplication();
		map.put(key, value);
	}

	/**
	 * 从request中删除指定的对象，对应ServletRequest的removeAttribute()方法。
	 * 
	 * @param key
	 *            对象标识
	 */
	public static void removeAttrFromRequest(String key) {
		HttpServletRequest request = getRequest();
		request.removeAttribute(key);
	}

	/**
	 * 从session中删除指定的对象，对应HttpSession的removeAttribute()方法。
	 * 
	 * @param key
	 *            对象标识
	 */
	public static void removeAttrFromSession(String key) {
		HttpServletRequest request = getRequest();
		request.getSession().removeAttribute(key);
	}

	/**
	 * 从application中删除指定的对象，对应ServletContext的removeAttribute()方法。
	 * 
	 * @param key
	 *            对象标识
	 */
	public static void removeAttrFromApplication(String key) {
		ServletContext context = getServletContext();
		context.removeAttribute(key);
	}

	/**
	 * 获取HttpServletRequest对象。
	 * 
	 * @return HttpServletRequest对象
	 */
	public static HttpServletRequest getRequest() {
		return (HttpServletRequest) ActionContext.getContext().get(HTTP_REQUEST);
	}

	/**
	 * 判断是否是Ajax请求
	 * 
	 * @return
	 */
	public static boolean isAjaxRequest() {
		HttpServletRequest request = getRequest();
		if (request.getHeader("x-requested-with") != null
				&& request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
			return true;
		}
		return false;
	}

	/**
	 * 获取HttpServletResponse对象。
	 * 
	 * @return HttpServletResponse对象
	 */
	public static HttpServletResponse getResponse() {
		return (HttpServletResponse) ActionContext.getContext().get(HTTP_RESPONSE);
	}

	/**
	 * 获取ServletContext对象。
	 * 
	 * @return ServletContext对象
	 */
	public static ServletContext getServletContext() {
		return (ServletContext) ActionContext.getContext().get(SERVLET_CONTEXT);
	}

	/**
	 * 获取工程上下文路径。
	 * 
	 * @return 工程上下文路径
	 */
	public static String getContextPath() {
		return getRequest().getContextPath();
	}
}
