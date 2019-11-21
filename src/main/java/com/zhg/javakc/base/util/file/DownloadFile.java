package com.zhg.javakc.base.util.file;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

/**
 * 文件下載操作
 * @author zhou
 * @version v0.1
 */
@Component
public class DownloadFile {

	public ResponseEntity<byte[]> download(String path, String name) {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDispositionFormData("attachment", name);
		byte[] b = null;
		try {
			b = FileUtils.readFileToByteArray( new File(path) );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ResponseEntity<byte[]>(b, headers,
				HttpStatus.OK);
	}
	
	public void download(HttpServletResponse response, String path, String name)
	{
		OutputStream out = null;
		File file = new File(path);
		response.reset(); 
		response.setContentType("application/octet-stream; charset=utf-8");
		
		try {
			name = new String(name.getBytes("UTF-8"), "ISO8859-1");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		response.setHeader("Content-Disposition", "attachment; filename="+name); 
		try {
			out = response.getOutputStream();
			out.write(FileUtils.readFileToByteArray(file)); 
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
}
