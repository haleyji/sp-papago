package com.sp.papago.test;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesReader {

	public static void main(String[] args) {
		/*
		 * String str = "1,2,3,4"; String[] array = str.split(","); for(int
		 * i=0;i<array.length;i++) { System.out.println(array[i]); }
		 */
	String path = "test.properties";
	//-> \\두번쓰는 이유:윈도우에서는 파일경로가 \인데 자바에서 \한번쓰면 뒤에있는 무언가를 바꿀 수 도 있어서 
	// \가 진짜 \라는 것을 알려주기 위해서 \\두번쓴다
	
		/*
		 * try {
		 * 
		 * FileInputStream fis = new FileInputStream(path); InputStreamReader isr = new
		 * InputStreamReader(fis); BufferedReader br = new BufferedReader(isr); String
		 * str = null; Map<String,String> map = new HashMap<>();
		 * while((str=br.readLine())!=null) { String key =
		 * str.substring(0,str.indexOf("=")); String value =
		 * str.substring(str.indexOf("=")+1); map.put(key, value); }
		 * System.out.println(map);
		 * 
		 * } catch (FileNotFoundException e) { e.printStackTrace(); } catch (IOException
		 * e) { e.printStackTrace(); }
		 */
	
	try {
		InputStream fis = PropertiesReader.class.getClassLoader().getResourceAsStream(path);
		Properties prop = new Properties();
		prop.load(fis);
		System.out.println(prop.getProperty("client.id"));
		System.out.println(prop.getProperty("client.secret"));
	} catch (FileNotFoundException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}
	
		/*
		 * String s = "client.id=1234=4"; String s2 = s.substring(0,s.indexOf("="));
		 * String[] array = new String[2]; array[0]=s.substring(0,s.indexOf("="));
		 * array[1]=s.substring(s.indexOf("=")+1,s.lastIndexOf("="));
		 * System.out.println(array[0]+"="+array[1]);
		 */
	}
	
	
}
