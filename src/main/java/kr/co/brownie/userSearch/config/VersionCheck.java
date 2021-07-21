package kr.co.brownie.userSearch.config;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class VersionCheck {
	public static String profileiconVersion = null;
	public static String summonerVersion = null;
	public static String championVersion = null;
	public static String mapVersion = null;
	public static String languageVersion = null;
	public static String stickerVersion = null;
	public static String itemVersion = null;
	
	public static void checkVersion() {
		BufferedReader br = null;
		try{            
			String urlstr = "https://ddragon.leagueoflegends.com/realms/kr.json";
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); // 여기에 문자열을 받아와라.
			String result = "";
			String line;
			while((line = br.readLine()) != null) { // 그 받아온 문자열을 계속 br에서 줄단위로 받고 출력하겠다.
				result = result + line;
			}
			JsonParser jsonParser = new JsonParser();
			JsonObject k = (JsonObject) jsonParser.parse(result);
			JsonObject object = (JsonObject) k.get("n");
			itemVersion = object.get("item").getAsString();
			summonerVersion = object.get("summoner").getAsString();
			championVersion = object.get("champion").getAsString();
			profileiconVersion = object.get("profileicon").getAsString();
			mapVersion = object.get("map").getAsString();
			languageVersion = object.get("language").getAsString();
			stickerVersion = object.get("sticker").getAsString();
		}
		catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
}
