package com.infini.b2e.utils;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

public class FileUtils {
	public String getRequestXML(String fileName) {
		ClassLoader classLoader = getClass().getClassLoader();
		File file = new File(classLoader.getResource(fileName).getFile());
		StringBuilder result = new StringBuilder("");
		try (Scanner scanner = new Scanner(file)) {

			while (scanner.hasNextLine()) {
				String line = scanner.nextLine();
				result.append(line).append("\n");
			}

			scanner.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result.toString();
	}
	
	public boolean existFile(String filePath) {
		return true;
	}
}
