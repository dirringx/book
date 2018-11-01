package com.book.core.util;

/**
 * 公用消息体
 */
public class CommonMsg {

	/**
	 * 返回状态码
	 */
	private String status;

	/**
	 * 返回消息内容
	 */
	private String message;

	/**
	 * 返回数据
	 */
	private String data;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

}
