package kr.co.brownie.auth.service.impl;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import kr.co.brownie.auth.service.AuthService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

@Service("authService")
public class AuthServiceImpl implements AuthService {
    @Resource(name = "authMapper")
    AuthMapper authMapper;

    @Override
    public String getAuthorize(String redirectUrl) {
        return "redirect:" + K_AUTH_URL + "/oauth/authorize" + "?client_id=" + REST_API_KEY + "&redirect_uri=" + redirectUrl + "&response_type=code";
    }

    @Override
    public String getToken(String code, String redirectUrl) throws IOException {
        String access_token;

        URL url = new URL(K_AUTH_URL + "/oauth/token");

        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setDoOutput(true);

        BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(httpURLConnection.getOutputStream()));
        String s = "grant_type=authorization_code" + "&client_id=" + REST_API_KEY + "&redirect_uri=" + redirectUrl + "&code=" + code;
        bufferedWriter.write(s);
        bufferedWriter.flush();

        JsonElement jsonElement = httpURLConnectionToJsonElement(httpURLConnection);

        access_token = jsonElement.getAsJsonObject().get("access_token").getAsString();

        bufferedWriter.close();
        return access_token;
    }

    @Override
    public String getUserInfoByToken(String access_token) throws IOException {
        String id;
        URL url = new URL(K_API_URL + "/v2/user/me");
        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setRequestProperty("Authorization", "Bearer " + access_token);

        JsonElement jsonElement = httpURLConnectionToJsonElement(httpURLConnection);
        id = jsonElement.getAsJsonObject().get("id").getAsString();

        return id;
    }

    private JsonElement httpURLConnectionToJsonElement(HttpURLConnection httpURLConnection) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));

        String line;
        StringBuilder stringBuilder = new StringBuilder();

        while ((line = bufferedReader.readLine()) != null) {
            stringBuilder.append(line);
        }

        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(stringBuilder.toString());

        bufferedReader.close();

        return element;
    }

    @Override
    public void insertUser(String id, String tempLolNick, String tempBrownieNick, String position) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("tempLolNick", tempLolNick);
        map.put("tempBrownieNick", tempBrownieNick);
        map.put("position", position);
//		System.out.println("User map" + map); //세웅
        authMapper.insertUser(map);
    }

    @Override
    public void insertExp(String id, int exp) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", id);
        map.put("exp", exp);
//		System.out.println("Exp map:" + map); // 세웅
        authMapper.insertExp(map);
    }

    @Override
    public void insertReview(int reviewSeq, String id, int starCnt, String reply, String writeUserId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("reviewSeq", reviewSeq);
        map.put("id", id);
        map.put("starCnt", starCnt);
        map.put("reply", reply);
        map.put("writeUserId", writeUserId);
//		System.out.println("Review map: " + map); // 세웅
        authMapper.insertReview(map);
    }

    @Override
    public int permitLevel(String userId) {
        return authMapper.permitlevel(userId);
    }

    @Override
    public void insertPermitLevel(String userId) throws IOException {
        authMapper.insertPermitLevel(userId);
    }
}
