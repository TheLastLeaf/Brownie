import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class Test {
    private final String USER_AGENT = "Mozilla/5.0";

    public static void main(String[] args) throws IOException {
        Test test = new Test();

        String responseContent = test.sendGet("https://esports.inven.co.kr/schedule/?mode=month&date=2021-07-01");

        for (Element element:Jsoup.parse(responseContent).select("li.display[data-league=\"524\"]")) {
            String href= element.select("a").attr("href");
            int dateStartIndex = href.indexOf("date=") + 5;
            int dateEndIndex = dateStartIndex + href.substring(dateStartIndex).indexOf("&");

            System.out.println(href.substring(dateStartIndex, dateEndIndex));
            System.out.println(element.select("span").get(0).text());
            System.out.println(element.select("span").get(1).text());
            System.out.println("----------");
        }
    }

    private String sendGet(String targetUrl) throws IOException {
        URL url = new URL(targetUrl);
        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();

        httpURLConnection.setRequestMethod("GET");
        httpURLConnection.setRequestProperty("User-Agent", USER_AGENT);

        int responseCode = httpURLConnection.getResponseCode();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
        String inputLine;
        StringBuilder stringBuilder = new StringBuilder();

        while ((inputLine = bufferedReader.readLine()) != null) {
            stringBuilder.append(inputLine);
        }
        bufferedReader.close();

        return stringBuilder.toString();
    }
}
