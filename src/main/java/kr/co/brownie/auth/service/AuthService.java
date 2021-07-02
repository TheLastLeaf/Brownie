package kr.co.brownie.auth.service;

import java.io.IOException;

public interface AuthService {
    String REST_API_KEY = "26a57e202a118708213a612eee4232fa";
    String K_AUTH_URL = "https://kauth.kakao.com";
    String K_API_URL = "https://kapi.kakao.com";
    String REDIRECT_URI = "http://localhost/oauth";

    String getAuthorize();

    String getToken(String code) throws IOException;

    String getUserInfoByToken(String access_token) throws IOException;
}
