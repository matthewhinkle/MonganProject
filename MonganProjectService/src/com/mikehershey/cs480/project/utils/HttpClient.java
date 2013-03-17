package com.mikehershey.cs480.project.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class HttpClient {

	public static String getContentsOfURL(String pageUrl) {
		StringBuilder data = new StringBuilder();
		System.out.println("Requesting: " + pageUrl);
		for(int i = 0; i < 5; i++) {
			try {
				URL url = new URL(pageUrl);
				URLConnection connection = url.openConnection();
				connection.setIfModifiedSince(System.currentTimeMillis() - 10000);
				connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.4; en-US; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2");
				connection.setConnectTimeout(30000);
				connection.setReadTimeout(30000);
				connection.connect();
				BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
				String line;
				while ((line = reader.readLine()) != null) {
					data.append(line);
				}
				reader.close();
				break;
			} catch (Exception e) {
				System.out.println("Failed to load page: " + pageUrl);
				e.printStackTrace();
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		}
	    String resp = data.toString();
		if(resp.isEmpty()) {
			return null;
		}
	    return resp;
	}
	
}