package com.book.core.util;

import java.util.HashSet;
import java.util.Set;

public class RandomUtils {

	@SuppressWarnings("unused")
	private static Set<Integer> randomNumberPool = new HashSet<Integer>();

	private RandomUtils() {}

	public static int nextRandom() {
		return 0;
	}

	/**
	 * 给定最大值的随机数
	 * 
	 * @param min
	 *            指定范围最小值
	 * @param max
	 *            指定范围最大值
	 */
	public static int randomSet(int min, int max) {
		if (max < min) {
			return randomSet(max,min);
		}
		
		// 调用Math.random()方法
		return (int) (Math.random() * (max - min)) + min;
	}
	
	/**
	 * 给定最大值的随机数
	 * 
	 * @param min
	 *            指定范围最小值
	 * @param max
	 *            指定范围最大值
	 * @param n
	 *            随机数个数
	 * @param HashSet<Integer>
	 *            randomNumberPool 随机数结果集
	 */
	public static void randomSet(int min, int max, int n ,Set<Integer> randomNumberPool) {
		if (n > (max - min + 1) || max < min) {
			return;
		}
		for (int i = 0; i < n; i++) {
			// 调用Math.random()方法
			int num = (int) (Math.random() * (max - min)) + min;
			randomNumberPool.add(num);// 将不同的数存入HashSet中
		}
		int setSize = randomNumberPool.size();
		// 如果存入的数小于指定生成的个数，则调用递归再生成剩余个数的随机数，如此循环，直到达到指定大小
		if (setSize < n) {
			randomSet(min, max, n - setSize, randomNumberPool);// 递归
		}
	}
}
