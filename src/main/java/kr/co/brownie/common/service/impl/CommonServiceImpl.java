package kr.co.brownie.common.service.impl;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import kr.co.brownie.common.service.CommonService;
import kr.co.brownie.common.service.LeagueCalendar;
import kr.co.brownie.common.service.TeamInfo;
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

        for (Element E : Jsoup.parse(responseContent).select("dl.dateList")) {
            String href = E.select("a").attr("href");
            int dateStartIndex = href.indexOf("date=") + 5;
            String datePart = href.substring(dateStartIndex);

            for (Element element : E.select("li.display[data-league=\"524\"]")) {
                String timePart = element.select("span").get(0).text();
                String[] teams = element.select("span").get(1).text().split("vs");
                leagueCalendarList.add(
                        LeagueCalendar.builder()
                                .date(simpleDateFormat.parse(datePart + timePart))
                                .aTeam(teams[0])
                                .bTeam(teams[1])
                                .build()
                );
            }
        }

        return leagueCalendarList;
    }

    @Override
    @SneakyThrows
    public List<TeamInfo> teamInfoList() {
        Gson gson = new Gson();
        List<TeamInfo> TeamInfoList = new ArrayList<>();

        String responseContent = sendGet("https://game.naver.com/esports/record/lck/team/lck_2021_summer");

        for (JsonElement jsonElement : gson.fromJson(Jsoup.parse(responseContent).select("#__NEXT_DATA__").html(),
                JsonObject.class).getAsJsonObject("props")
                .getAsJsonObject("initialState")
                .getAsJsonObject("ranking")
                .getAsJsonArray("teamRanking")) {
            JsonObject jsonObject = jsonElement.getAsJsonObject();
            JsonObject addInfo = jsonObject.getAsJsonObject("addInfo");
            JsonObject team = jsonObject.getAsJsonObject("team");

            TeamInfoList.add(TeamInfo.builder()
                    .teamId(jsonObject.get("teamId").getAsString())
                    .leagueId(jsonObject.get("leagueId").getAsString())
                    .bracket(jsonObject.get("bracket").getAsString())
                    .rank(jsonObject.get("rank").getAsInt())
                    .wins(jsonObject.get("wins").getAsInt())
                    .loses(jsonObject.get("loses").getAsInt())
                    .draws(jsonObject.get("draws").getAsInt())
                    .score(jsonObject.get("score").getAsInt())
                    .winRate(jsonObject.get("winRate").getAsFloat())

                    .kda(addInfo.get("kda").getAsFloat())
                    .kills(addInfo.get("kills").getAsInt())
                    .deaths(addInfo.get("deaths").getAsInt())
                    .assists(addInfo.get("assists").getAsInt())
                    .firstKillRate(addInfo.get("firstKillRate").getAsFloat())
                    .firstTowerRate(addInfo.get("firstTowerRate").getAsFloat())
                    .firstBaronRate(addInfo.get("firstBaronRate").getAsFloat())

                    .gameCode(team.get("gameCode").getAsString())
                    .name(team.get("name").getAsString())
                    .nameAcronym(team.get("nameAcronym").getAsString())
                    .nameEng(team.get("nameEng").getAsString())
                    .nameEngAcronym(team.get("nameEngAcronym").getAsString())
                    .imageUrl(team.get("imageUrl").getAsString())
                    .colorImageUrl(team.get("colorImageUrl").getAsString())
                    .whiteImageUrl(team.get("whiteImageUrl").getAsString())
                    .blackImageUrl(team.get("blackImageUrl").getAsString())

                    .build());
        }
        return TeamInfoList;
    }

    @SneakyThrows
    private String sendGet(String targetUrl) {
        URL url = new URL(targetUrl);
        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();

        httpURLConnection.setRequestMethod("GET");
        httpURLConnection.setRequestProperty("User-Agent", USER_AGENT);

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
