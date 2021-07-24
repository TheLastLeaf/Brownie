package kr.co.brownie.common.service.impl;

import kr.co.brownie.common.service.CommonService;
import kr.co.brownie.common.service.LeagueCalendar;
import lombok.SneakyThrows;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("commonService")
public class CommonServiceImpl implements CommonService {
    @Resource(name = "commonMapper")
    CommonMapper commonMapper;

    @Override
    @SneakyThrows
    public List<LeagueCalendar> leagueCalendarList() {
        List<LeagueCalendar> leagueCalendarList = new ArrayList<>();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-ddHH:mm");

        String responseContent = sendGet(
                String.format(
                        "https://esports.inven.co.kr/schedule/?mode=month&date=%s&game=1368",
                        new SimpleDateFormat("yyyy-MM-dd").format(new Date())
                )
        );

        for (Element element : Jsoup.parse(responseContent).select("li.display[data-league=\"524\"]")) {
            String href = element.select("a").attr("href");
            int dateStartIndex = href.indexOf("date=") + 5;
            int dateEndIndex = dateStartIndex + href.substring(dateStartIndex).indexOf("&");

            String datePart = href.substring(dateStartIndex, dateEndIndex);
            String timePart = element.select("span").get(0).text();
            String[] teams = element.select("span").get(1).text().split("vs");
            leagueCalendarList.add(
                    LeagueCalendar.builder()
                            .date(simpleDateFormat.parse(datePart+timePart))
                            .aTeam(teams[0])
                            .bTeam(teams[1])
                            .build()
            );
        }

        return leagueCalendarList;
    }

    @SneakyThrows
    private String sendGet(String targetUrl) {
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
