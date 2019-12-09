package com.sp.papago.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sp.papago.dao.PapagoDAO;
import com.sp.papago.vo.Message;
import com.sp.papago.vo.PapagoInfoVO;
import com.sp.papago.vo.TranslateVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PapagoServiceImpl implements PapagoService {

	@Value("${client.id}")
	private String id;
	@Value("${client.secret}")
	private String secret;
	@Value("${client.api.url}")
	private String apiUrl;
	private ObjectMapper om = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
	
	@Resource
	private PapagoDAO pdao;
	
	@Override
	public Message doTranslate(TranslateVO tvo) {
		try {
			String text = URLEncoder.encode(tvo.getText(), "UTF-8");
			URL url = new URL(apiUrl);
			HttpURLConnection hc = (HttpURLConnection) url.openConnection();
			hc.setRequestMethod("POST");
			hc.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
			hc.setRequestProperty("X-Naver-Client-Id", id);
			hc.setRequestProperty("X-Naver-Client-Secret", secret);
			String param = "source="+tvo.getSource()+ "&target="+ tvo.getTarget()+"&text=" + text;
			
			hc.setDoOutput(true);
			DataOutputStream dos = new DataOutputStream(hc.getOutputStream());
			dos.writeBytes(param);
			dos.flush();
			dos.close();
			int status = hc.getResponseCode();
			InputStreamReader isr = new InputStreamReader(hc.getInputStream());
			BufferedReader br = new BufferedReader(isr);
			StringBuffer res = new StringBuffer();
			String str = null;
			while ((str = br.readLine()) != null) {
				res.append(str);
			}
			TranslateVO resultTvo = om.readValue(res.toString(), TranslateVO.class);
			log.info(res.toString());
			log.info("tvo => {}",resultTvo);
			return resultTvo.getMessage();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<PapagoInfoVO> getPpgInfoList(PapagoInfoVO pvo){
		return pdao.selectPpgInfoList(pvo);
	}
}
