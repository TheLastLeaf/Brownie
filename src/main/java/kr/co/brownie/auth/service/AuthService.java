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

	void insertUser(String id, String tempLolNick, String tempBrownieNick, String position) throws IOException;

	void insertPermitLevel(String id) throws IOException;

	void insertExp(String id, int exp) throws IOException;

	void insertReview(int reviewSeq, String id, int starCnt, String reply, String writeUserId)throws IOException;

	int permitLevel(String userId);

}
