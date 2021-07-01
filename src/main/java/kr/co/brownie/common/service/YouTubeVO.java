package kr.co.brownie.common.service;

import lombok.Data;

@Data
public class YouTubeVO {
    private String kind;
    private String etag;
    private String idKind;
    private String idVideoid;
    private String snippetPublishedat;
    private String snippetChannelid;
    private String snippetTitle;
    private String snippetDescription;
    private String snippetThumbnailsDefaultUrl;
    private String snippetThumbnailsDefaultWidth;
    private String snippetThumbnailsDefaultHeight;
    private String snippetThumbnailsMediumUrl;
    private String snippetThumbnailsMediumWidth;
    private String snippetThumbnailsMediumHeight;
    private String snippetThumbnailsHighUrl;
    private String snippetThumbnailsHighWidth;
    private String snippetThumbnailsHighHeight;
    private String snippetChanneltitle;
    private String snippetLivebroadcastcontent;
    private String snippetPublishtime;
}
