package com.book.core.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.http.HttpServletRequest;

public final class CommonUtils {

	private CommonUtils(){}
	
	/**
	 * 获取IP地址
	 * 
	 * @return
	 */
	public static String getIP() {
		HttpServletRequest request = ActionContextUtils.getRequest();
		String ip = request.getHeader("X-real-ip");
		if (StringUtils.isEmpty(ip) || ip.contains("0:0:0:0:0:0:0:1")) {
			ip = request.getRemoteAddr();
			if (ip.contains("0:0:0:0:0:0:0:1")) {
				ip = "127.0.0.1";
			}
		}
		return ip;
	}

	/**
	 * 发起HTTP请求
	 * 
	 * @param urlStr
	 * @param content
	 * @return
	 */
	public static String fromHttp(String urlStr, String content) {

		URL url = null;
		HttpURLConnection connection = null;
		try {
			url = new URL(urlStr);
			connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setRequestMethod("POST");
			connection.setUseCaches(false);
			connection.connect();
			DataOutputStream out = new DataOutputStream(connection.getOutputStream());
			out.write(content.getBytes("utf-8"));
			out.flush();
			out.close();
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
			StringBuffer buffer = new StringBuffer();
			String line = "";
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}

			reader.close();
			return buffer.toString();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				connection.disconnect();
			}
		}
		return null;
	}

}
