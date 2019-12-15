package com.infini.b2e.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.FileTime;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class ZIPUtils {
	private List<String> zipedFiles = null;
	
	public void createZipCsvFile(String zipDir, String zipOutputFile) throws Exception {
		Path directory = Paths.get(zipDir);
		File zipFileName = Paths.get(zipOutputFile).toFile();
		ZipOutputStream zipStream = new ZipOutputStream(new FileOutputStream(zipFileName));
		DirectoryStream<Path> dirStream = Files.newDirectoryStream(directory);

		zipedFiles = new ArrayList<String>();
		dirStream.forEach(path -> _addToZipFile(path, zipStream));
		dirStream.close();
		
		zipStream.closeEntry();
		zipStream.flush();
		zipStream.close();
		
		_deleteZipedFiles();
	}

	private void _addToZipFile(Path file, ZipOutputStream zipStream) {
		String filePath = file.toFile().getPath();
		if (_isCSVFile(filePath)) {
			String inputFileName = file.toFile().getPath();
			try (FileInputStream inputStream = new FileInputStream(inputFileName)) {
				ZipEntry entry = new ZipEntry(file.toFile().getName());
				entry.setCreationTime(FileTime.fromMillis(file.toFile().lastModified()));

				zipStream.putNextEntry(entry);

				byte[] readBuffer = new byte[2048];
				int amountRead;

				while ((amountRead = inputStream.read(readBuffer)) > 0) {
					zipStream.write(readBuffer, 0, amountRead);
				}

				zipedFiles.add(filePath);
			} catch (IOException e) {
				// throw e;
			}
		}
	}
	
	private void _deleteZipedFiles() throws Exception {
		for (String path : zipedFiles) {
			Files.deleteIfExists(Paths.get(path));
		}
	}

	private boolean _isCSVFile(String filePath) {
		int beginIndex = filePath.length() - 3;
		int endIndex = beginIndex + 3;

		String extensionFile = filePath.substring(beginIndex, endIndex);
		if ("csv".equals(extensionFile)) {
			return true;
		}
		return false;
	}
	
	public void _deleteFileZip(String filePath) {
		try {
			Files.deleteIfExists(Paths.get(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
