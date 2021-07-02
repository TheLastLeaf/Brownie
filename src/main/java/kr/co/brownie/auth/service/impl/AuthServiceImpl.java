package kr.co.brownie.auth.service.impl;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import kr.co.brownie.auth.service.AuthService;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

@Service("authService")
public class AuthServiceImpl implements AuthService {
    @Override
    public String getAuthorize() {
        return "redirect:" + K_AUTH_URL + "/oauth/authorize" +
                "?client_id=" + REST_API_KEY +
                "&redirect_uri=" + REDIRECT_URI +
                "&response_type=code";
    }

    @Override
    public String getToken(String code) throws IOException {
        String access_token;

        URL url = new URL(K_AUTH_URL + "/oauth/token");
        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setDoOutput(true);

        BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(httpURLConnection.getOutputStream()));
        String s = "grant_type=authorization_code" +
                "&client_id=" + REST_API_KEY +
                "&redirect_uri=" + REDIRECT_URI +
                "&code=" + code;
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
}
