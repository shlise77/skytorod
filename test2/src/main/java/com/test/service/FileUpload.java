package com.test.service;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUpload {
	public boolean fileUpload(MultipartHttpServletRequest mRequest) {

		boolean isSuccess = false;

		String uploadPath = "D:/image/";

		File dir = new File(uploadPath);

		if (!dir.isDirectory()) {

			dir.mkdirs();

		}

		Iterator<String> iter = mRequest.getFileNames();

		while(iter.hasNext()) {

			String uploadFileName = iter.next();

			MultipartFile mFile = mRequest.getFile(uploadFileName);

			String originalFileName = mFile.getOriginalFilename();

			String saveFileName = originalFileName;

				

			if(saveFileName != null && !saveFileName.equals("")) {

				if(new File(uploadPath + saveFileName).exists()) {

					saveFileName = saveFileName + "_" + System.currentTimeMillis();

				}

				try {

					mFile.transferTo(new File(uploadPath + saveFileName));

					isSuccess = true;				

				} catch (IllegalStateException e) {

					e.printStackTrace();

					isSuccess = false;

				} catch (IOException e) {

					e.printStackTrace();

					isSuccess = false;

				}

			} // if end

		} // while end

		return isSuccess;

	} // fileUpload end

}
