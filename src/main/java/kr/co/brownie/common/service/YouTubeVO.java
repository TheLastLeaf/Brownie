

package kr.co.brownie.common.service;

public class YouTubeVO {
	private int youtubeSeq;
	private String kind;
	private String etag;
	private String nextPageToken;
	private String regionCode;
	private String totalResults;
	private String resultsPerPage;
	private String itemsKind;
	private String itemsEtag;
	private String itemsIdKind;
	private String itemsIdVideoId;
	private String itemsSnippetPublishedAt;
	private String itemsSnippetChannelId;
	private String itemsSnippetTitle;
	private String itemsSnippetDescription;
	private String thumnailsDefaultUrl;
	private String thumnailsDefaultWidth;
	private String thumnailsDefaultHeight;
	private String thumnailsMediumUrl;
	private String thumnailsMediumWidth;
	private String thumnailsMediumHeight;
	private String thumnailsHighUrl;
	private String thumnailsHighWidth;
	private String thumnailsHighHeight;
	private String itemsSnippetChannelTitle;
	private String itemsSnippetLiveBroadcastContent;
	private String itemsSnippetPublishTime;
	private String inDate;

	public YouTubeVO() {}

	public YouTubeVO(int youtubeSeq, String kind, String etag, String nextPageToken, String regionCode,
			String totalResults, String resultsPerPage, String itemsKind, String itemsEtag, String itemsIdKind,
			String itemsIdVideoId, String itemsSnippetPublishedAt, String itemsSnippetChannelId,
			String itemsSnippetTitle, String itemsSnippetDescription, String thumnailsDefaultUrl,
			String thumnailsDefaultWidth, String thumnailsDefaultHeight, String thumnailsMediumUrl,
			String thumnailsMediumWidth, String thumnailsMediumHeight, String thumnailsHighUrl,
			String thumnailsHighWidth, String thumnailsHighHeight, String itemsSnippetChannelTitle,
			String itemsSnippetLiveBroadcastContent, String itemsSnippetPublishTime, String inDate) {
		super();
		this.youtubeSeq = youtubeSeq;
		this.kind = kind;
		this.etag = etag;
		this.nextPageToken = nextPageToken;
		this.regionCode = regionCode;
		this.totalResults = totalResults;
		this.resultsPerPage = resultsPerPage;
		this.itemsKind = itemsKind;
		this.itemsEtag = itemsEtag;
		this.itemsIdKind = itemsIdKind;
		this.itemsIdVideoId = itemsIdVideoId;
		this.itemsSnippetPublishedAt = itemsSnippetPublishedAt;
		this.itemsSnippetChannelId = itemsSnippetChannelId;
		this.itemsSnippetTitle = itemsSnippetTitle;
		this.itemsSnippetDescription = itemsSnippetDescription;
		this.thumnailsDefaultUrl = thumnailsDefaultUrl;
		this.thumnailsDefaultWidth = thumnailsDefaultWidth;
		this.thumnailsDefaultHeight = thumnailsDefaultHeight;
		this.thumnailsMediumUrl = thumnailsMediumUrl;
		this.thumnailsMediumWidth = thumnailsMediumWidth;
		this.thumnailsMediumHeight = thumnailsMediumHeight;
		this.thumnailsHighUrl = thumnailsHighUrl;
		this.thumnailsHighWidth = thumnailsHighWidth;
		this.thumnailsHighHeight = thumnailsHighHeight;
		this.itemsSnippetChannelTitle = itemsSnippetChannelTitle;
		this.itemsSnippetLiveBroadcastContent = itemsSnippetLiveBroadcastContent;
		this.itemsSnippetPublishTime = itemsSnippetPublishTime;
		this.inDate = inDate;
	}

	public int getYoutubeSeq() {
		return youtubeSeq;
	}
	public void setYoutubeSeq(int youtubeSeq) {
		this.youtubeSeq = youtubeSeq;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getEtag() {
		return etag;
	}
	public void setEtag(String etag) {
		this.etag = etag;
	}
	public String getNextPageToken() {
		return nextPageToken;
	}
	public void setNextPageToken(String nextPageToken) {
		this.nextPageToken = nextPageToken;
	}
	public String getRegionCode() {
		return regionCode;
	}
	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}
	public String getTotalResults() {
		return totalResults;
	}
	public void setTotalResults(String totalResults) {
		this.totalResults = totalResults;
	}
	public String getResultsPerPage() {
		return resultsPerPage;
	}
	public void setResultsPerPage(String resultsPerPage) {
		this.resultsPerPage = resultsPerPage;
	}
	public String getItemsKind() {
		return itemsKind;
	}
	public void setItemsKind(String itemsKind) {
		this.itemsKind = itemsKind;
	}
	public String getItemsEtag() {
		return itemsEtag;
	}
	public void setItemsEtag(String itemsEtag) {
		this.itemsEtag = itemsEtag;
	}
	public String getItemsIdKind() {
		return itemsIdKind;
	}
	public void setItemsIdKind(String itemsIdKind) {
		this.itemsIdKind = itemsIdKind;
	}
	public String getItemsIdVideoId() {
		return itemsIdVideoId;
	}
	public void setItemsIdVideoId(String itemsIdVideoId) {
		this.itemsIdVideoId = itemsIdVideoId;
	}
	public String getItemsSnippetPublishedAt() {
		return itemsSnippetPublishedAt;
	}
	public void setItemsSnippetPublishedAt(String itemsSnippetPublishedAt) {
		this.itemsSnippetPublishedAt = itemsSnippetPublishedAt;
	}
	public String getItemsSnippetChannelId() {
		return itemsSnippetChannelId;
	}
	public void setItemsSnippetChannelId(String itemsSnippetChannelId) {
		this.itemsSnippetChannelId = itemsSnippetChannelId;
	}
	public String getItemsSnippetTitle() {
		return itemsSnippetTitle;
	}
	public void setItemsSnippetTitle(String itemsSnippetTitle) {
		this.itemsSnippetTitle = itemsSnippetTitle;
	}
	public String getItemsSnippetDescription() {
		return itemsSnippetDescription;
	}
	public void setItemsSnippetDescription(String itemsSnippetDescription) {
		this.itemsSnippetDescription = itemsSnippetDescription;
	}
	public String getThumnailsDefaultUrl() {
		return thumnailsDefaultUrl;
	}
	public void setThumnailsDefaultUrl(String thumnailsDefaultUrl) {
		this.thumnailsDefaultUrl = thumnailsDefaultUrl;
	}
	public String getThumnailsDefaultWidth() {
		return thumnailsDefaultWidth;
	}
	public void setThumnailsDefaultWidth(String thumnailsDefaultWidth) {
		this.thumnailsDefaultWidth = thumnailsDefaultWidth;
	}
	public String getThumnailsDefaultHeight() {
		return thumnailsDefaultHeight;
	}
	public void setThumnailsDefaultHeight(String thumnailsDefaultHeight) {
		this.thumnailsDefaultHeight = thumnailsDefaultHeight;
	}
	public String getThumnailsMediumUrl() {
		return thumnailsMediumUrl;
	}
	public void setThumnailsMediumUrl(String thumnailsMediumUrl) {
		this.thumnailsMediumUrl = thumnailsMediumUrl;
	}
	public String getThumnailsMediumWidth() {
		return thumnailsMediumWidth;
	}
	public void setThumnailsMediumWidth(String thumnailsMediumWidth) {
		this.thumnailsMediumWidth = thumnailsMediumWidth;
	}
	public String getThumnailsMediumHeight() {
		return thumnailsMediumHeight;
	}
	public void setThumnailsMediumHeight(String thumnailsMediumHeight) {
		this.thumnailsMediumHeight = thumnailsMediumHeight;
	}
	public String getThumnailsHighUrl() {
		return thumnailsHighUrl;
	}
	public void setThumnailsHighUrl(String thumnailsHighUrl) {
		this.thumnailsHighUrl = thumnailsHighUrl;
	}
	public String getThumnailsHighWidth() {
		return thumnailsHighWidth;
	}
	public void setThumnailsHighWidth(String thumnailsHighWidth) {
		this.thumnailsHighWidth = thumnailsHighWidth;
	}
	public String getThumnailsHighHeight() {
		return thumnailsHighHeight;
	}
	public void setThumnailsHighHeight(String thumnailsHighHeight) {
		this.thumnailsHighHeight = thumnailsHighHeight;
	}
	public String getItemsSnippetChannelTitle() {
		return itemsSnippetChannelTitle;
	}
	public void setItemsSnippetChannelTitle(String itemsSnippetChannelTitle) {
		this.itemsSnippetChannelTitle = itemsSnippetChannelTitle;
	}
	public String getItemsSnippetLiveBroadcastContent() {
		return itemsSnippetLiveBroadcastContent;
	}
	public void setItemsSnippetLiveBroadcastContent(String itemsSnippetLiveBroadcastContent) {
		this.itemsSnippetLiveBroadcastContent = itemsSnippetLiveBroadcastContent;
	}
	public String getItemsSnippetPublishTime() {
		return itemsSnippetPublishTime;
	}
	public void setItemsSnippetPublishTime(String itemsSnippetPublishTime) {
		this.itemsSnippetPublishTime = itemsSnippetPublishTime;
	}
	public String getInDate() {
		return inDate;
	}
	public void setInDate(String inDate) {
		this.inDate = inDate;
	}

	@Override
	public String toString() {
		return "YouTubeVO [youtubeSeq=" + youtubeSeq + ", kind=" + kind + ", etag=" + etag + ", nextPageToken="
				+ nextPageToken + ", regionCode=" + regionCode + ", totalResults=" + totalResults + ", resultsPerPage="
				+ resultsPerPage + ", itemsKind=" + itemsKind + ", itemsEtag=" + itemsEtag + ", itemsIdKind="
				+ itemsIdKind + ", itemsIdVideoId=" + itemsIdVideoId + ", itemsSnippetPublishedAt="
				+ itemsSnippetPublishedAt + ", itemsSnippetChannelId=" + itemsSnippetChannelId + ", itemsSnippetTitle="
				+ itemsSnippetTitle + ", itemsSnippetDescription=" + itemsSnippetDescription + ", thumnailsDefaultUrl="
				+ thumnailsDefaultUrl + ", thumnailsDefaultWidth=" + thumnailsDefaultWidth + ", thumnailsDefaultHeight="
				+ thumnailsDefaultHeight + ", thumnailsMediumUrl=" + thumnailsMediumUrl + ", thumnailsMediumWidth="
				+ thumnailsMediumWidth + ", thumnailsMediumHeight=" + thumnailsMediumHeight + ", thumnailsHighUrl="
				+ thumnailsHighUrl + ", thumnailsHighWidth=" + thumnailsHighWidth + ", thumnailsHighHeight="
				+ thumnailsHighHeight + ", itemsSnippetChannelTitle=" + itemsSnippetChannelTitle
				+ ", itemsSnippetLiveBroadcastContent=" + itemsSnippetLiveBroadcastContent
				+ ", itemsSnippetPublishTime=" + itemsSnippetPublishTime + ", inDate=" + inDate + "]";
	}


}
