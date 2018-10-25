package com.book.core.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 字符串实用类，进行字符串的相关操作。
 * 
 * @author Administrator
 *
 */
public final class StringUtils {

	private StringUtils() {
	}

	/**
	 * 空字符串数组
	 */
	public static final String[] EMPTY_STRING_ARRAY = new String[0];
	/**
	 * 空字符串
	 */
	public static final String EMPTY = "";

	/**
	 * 将指定对象字符化，并返回转化结果。
	 * 
	 * @param obj
	 *            待字符化对象
	 * 
	 * @return 转化结果
	 */
	public static String valueOf(Object obj) {
		return (obj == null) ? "" : obj.toString().trim();
	}

	/**
	 * 判断字符串是否为null或""字符串
	 * 
	 * @param value
	 *            字符串（判断对象）
	 * 
	 * @return 如果为空或""，则返回true，否则返回false。
	 * 
	 */
	public static boolean isEmpty(String value) {
		return (value == null || value.trim().equals(""));
	}

	/**
	 * 判断字符串是否不为空或""。
	 * 
	 * @param value
	 *            字符串（判断对象）
	 * 
	 * @return 如果不为空或""，则返回true，否则返回false。
	 * 
	 */
	public static boolean isNotEmpty(String value) {
		return !isEmpty(value);
	}

	/**
	 * 返回字符串的副本，忽略前导空白和尾部空白。 如果传入的字符串为null，则返回空字符串。
	 * <p>
	 * Examples:
	 * 
	 * <pre>
	 * 	StringUtils.trimToEmpty(null)          = ""
	 * 	StringUtils.trimToEmpty("")            = ""
	 * 	StringUtils.trimToEmpty("     ")       = ""
	 * 	StringUtils.trimToEmpty("abc")         = "abc"
	 * 	StringUtils.trimToEmpty("    abc    ") = "abc"
	 * </pre>
	 * 
	 * @param str
	 *            字符串
	 * 
	 * @return 移除了前导和尾部空白的字符串的副本。<br>
	 *         如果没有前导和尾部空白，则返回此字符串；如果字符串为null，则返回空字符串。
	 */
	public static String trimToEmpty(String str) {
		return str == null ? EMPTY : str.trim();
	}

	/**
	 * HTML编码（转义字符）处理。
	 * 
	 * @param s
	 *            字符串
	 * 
	 * @return 处理后的字符串
	 */
	public final static String htmlEncode(String s) {
		return htmlEncode(s, true);
	}

	/**
	 * Escape html entity characters and high characters (eg "curvy" Word
	 * quotes). Note this method can also be used to encode XML.
	 * 
	 * @param s
	 *            the String to escape.
	 * @param encodeSpecialChars
	 *            if true high characters will be encode other wise not.
	 * 
	 * @return the escaped string
	 */
	private final static String htmlEncode(String s, boolean encodeSpecialChars) {
		if (s == null) {
			s = "";
		}
		StringBuffer str = new StringBuffer();
		for (int j = 0; j < s.length(); j++) {
			char c = s.charAt(j);
			// encode standard ASCII characters into HTML entities where needed
			if (c < '\200') {
				switch (c) {
				case '"':
					str.append("&quot;");
					break;
				case '&':
					str.append("&amp;");
					break;
				case '<':
					str.append("&lt;");
					break;
				case '>':
					str.append("&gt;");
					break;
				default:
					str.append(c);
				}
			}
			// encode 'ugly' characters (ie Word "curvy" quotes etc)
			else if (encodeSpecialChars && (c < '\377')) {
				String hexChars = "0123456789ABCDEF";
				int a = c % 16;
				int b = (c - a) / 16;
				String hex = "" + hexChars.charAt(b) + hexChars.charAt(a);
				str.append("&#x" + hex + ";");
			}
			// add other characters back in - to handle charactersets
			// other than ascii
			else {
				str.append(c);
			}
		}
		return str.toString();
	}

	/**
	 * 生成编号(由编号类型编码+编号创建平台编码+6位日期+时间戳后4位+3位随机数组成)
	 * 
	 * @param numType
	 *            编号类型,1位(1-支付订单,2-退款订单)
	 * @param platform
	 *            编号生成平台,1位(1-PC平台,2app平台,3移动web平台)
	 * @return
	 * @throws Exception
	 */
	public static String createOrderNumber(int numType, int platform) {
		DateFormat format = new SimpleDateFormat("yyMMdd");
		Date date = new Date();
		StringBuffer buffer = new StringBuffer();
		buffer.append(numType);
		buffer.append(platform);
		buffer.append(format.format(date));
		buffer.append((date.getTime() + "").substring(9));
		buffer.append(RandomUtils.randomSet(0, 999));
		return buffer.toString();
	}
}
