package com.cai.dto;

public class JobRecommend {

    private String recruitId;

    private int isMoreJob;

    private String jobName;

    private String publisherName;

    private String salary;

    private long publishDate;

    private String publisherId;

    public String getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(String publisherId) {
        this.publisherId = publisherId;
    }

    public int getRecruitType() {
        return recruitType;
    }

    public void setRecruitType(int recruitType) {
        this.recruitType = recruitType;
    }

    private int recruitType;

    public String getRecruitId() {
        return recruitId;
    }

    public void setRecruitId(String recruitId) {
        this.recruitId = recruitId;
    }

    public int getIsMoreJob() {
        return isMoreJob;
    }

    public void setIsMoreJob(int isMoreJob) {
        this.isMoreJob = isMoreJob;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getPublisherName() {
        return publisherName;
    }

    public void setPublisherName(String publisherName) {
        this.publisherName = publisherName;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public long getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(long publishDate) {
        this.publishDate = publishDate;
    }
}
