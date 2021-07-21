package kr.co.brownie.userSearch.Service;


public class LeagueEntryVO {
	private String queueType;
	private int wins;
	private int losses;
	private String leagueId;
	private String rank;
	private String tier;
	private int leaguePoints;
	
	public LeagueEntryVO() {
	} 
	
	public LeagueEntryVO(String queueType,  int wins, int losses, String leagueId, String rank,
			String tier, int leaguePoints) {
		super();
		this.queueType = queueType;
		this.wins = wins;
		this.losses = losses;
		this.leagueId = leagueId;
		this.rank = rank;
		this.tier = tier;
		this.leaguePoints = leaguePoints;
	}

	public String getQueueType() {
		return queueType;
	}

	public void setQueueType(String queueType) {
		this.queueType = queueType;
	}

	public int getWins() {
		return wins;
	}

	public void setWins(int wins) {
		this.wins = wins;
	}

	public int getLosses() {
		return losses;
	}

	public void setLosses(int losses) {
		this.losses = losses;
	}

	public String getLeagueId() {
		return leagueId;
	}

	public void setLeagueId(String leagueId) {
		this.leagueId = leagueId;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getTier() {
		return tier;
	}

	public void setTier(String tier) {
		this.tier = tier;
	}

	public int getLeaguePoints() {
		return leaguePoints;
	}

	public void setLeaguePoints(int leaguePoints) {
		this.leaguePoints = leaguePoints;
	}

	@Override
	public String toString() {
		return "LeagueEntrydto [queueType=" + queueType + ", wins=" + wins
				+ ", losses=" + losses + ", leagueId=" + leagueId + ", rank=" + rank + ", tier=" + tier
				+ ", leaguePoints=" + leaguePoints + "]";
	}
}

