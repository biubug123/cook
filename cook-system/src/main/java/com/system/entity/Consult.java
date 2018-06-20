package com.system.entity;

public class Consult {
    private String id;

    private String publisherName;

    private int consultType;

    private long publishDate;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPublisherName() {
        return publisherName;
    }

    public void setPublisherName(String publisherName) {
        this.publisherName = publisherName;
    }

    public int getConsultType() {
        return consultType;
    }

    public void setConsultType(int consultType) {
        this.consultType = consultType;
    }

    public long getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(long publishDate) {
        this.publishDate = publishDate;
    }
}
