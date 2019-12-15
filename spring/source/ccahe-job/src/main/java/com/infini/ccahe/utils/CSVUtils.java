package com.infini.ccahe.utils;

import java.io.FileWriter;
import java.io.Writer;
import java.util.List;


public class CSVUtils {
	//private static final Logger logger = LoggerFactory.getLogger(CSVUtils.class);
	private static final char DEFAULT_SEPARATOR = ',';
	private static final char CHAR_BLANK = ' ';
	private static final String DEFAULT_BREAK_LINE = "\n";

	private Writer writer = null;

	public void createCSV(String filePath) throws Exception {
		FileWriter fileWriter = new FileWriter(filePath);
		this.writer = fileWriter;
	}

	public void saveCSV() throws Exception {
		this.writer.flush();
		this.writer.close();
	}

	public void writeCSVLine(List<String> values) throws Exception {
		writeCSVLine(values, DEFAULT_SEPARATOR, CHAR_BLANK);
	}

	public void writeCSVLine(List<String> values, char separators) throws Exception {
		writeCSVLine(values, separators, CHAR_BLANK);
	}

	public void writeCSVLine(List<String> values, char separators, char quote) throws Exception {
		if (separators == CHAR_BLANK) {
			separators = DEFAULT_SEPARATOR;
		}

		StringBuffer sb = new StringBuffer();
		boolean firstElement = true;
		for (String value : values) {
			if (!firstElement) {
				sb.append(separators);
			}

			if (quote == CHAR_BLANK) {
				sb.append(_formatCSV(value));
			} else {
				sb.append(quote).append(_formatCSV(value)).append(quote);
			}

			firstElement = false;
		}
		sb.append(DEFAULT_BREAK_LINE);
		writer.append(sb.toString());
	}

	private String _formatCSV(String value) throws Exception {

		String result = value;
		if (result != null && result.contains("\"")) {
			result = result.replace("\"", "\"\"");
		}
		return result;
	}
}
