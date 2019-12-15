package com.infini.ccahe.utils;

public class StringUtils {
	public static boolean isNullOrEmpty(String text) {
		if (text == null)
			return true;
		if ("".equals(text))
			return true;

		return false;
	}
}
