package com.sp.papago.test;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.Data;


@Data
public class PapagoTest {

	@Value("${client.id}")
	private String id;
	@Value("${client.secret}")
	private String secret;
	@Value("${client.api.url}")
	private String apiUrl;

	public void doPapagoTest() {
		try {
			String text = URLEncoder.encode("김조조 일찍자라", "UTF-8");
			URL url = new URL(apiUrl);
			// apiurl이 url형태인지 확인하는 라인
			HttpURLConnection hc = (HttpURLConnection) url.openConnection();
			// 연결
			// 자바도 http통신이 가능하다. url 객체로 apiurl을 읽어 들인 다음에, open connection을 해준다.
			hc.setRequestMethod("POST");
			hc.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
			hc.setRequestProperty("X-Naver-Client-Id", id);
			hc.setRequestProperty("X-Naver-Client-Secret", secret);

			String param = "source=ko&target=en&text=" + text;
			hc.setDoOutput(true);
			DataOutputStream dos = new DataOutputStream(hc.getOutputStream());
			dos.writeBytes(param);
			dos.flush();
			dos.close();

			int status = hc.getResponseCode();
			if (status != 200) {
				System.out.println("에러남");
				return;
			}
			InputStreamReader isr = new InputStreamReader(hc.getInputStream());
			BufferedReader br = new BufferedReader(isr);
			String res = "";
			String str = null;
			while ((str = br.readLine()) != null) {
				res += str;
			}
			System.out.println(res);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
