package com.cai.dto;

import com.cook.entity.Welfare;

import java.util.List;

public class Recruit2 {
    private String recruitId;

    private int recruitType;

    private String publisherId;

    private String publisherName;

    private int isMoreJob;

    private String jobName;

    private String salary;

    private String foodTypeName;

    private String publisherWorkArea;

    private long publishDate;

    private List<String> welfareList;

    public String getRecruitId() {
        return recruitId;
    }

    public void setRecruitId(String recruitId) {
        this.recruitId = recruitId;
    }

    public String getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(String publisherId) {
        this.publisherId = publisherId;
    }

    public String getPublisherWorkArea() {
        return publisherWorkArea;
    }

    public void setPublisherWorkArea(String publisherWorkArea) {
        this.publisherWorkArea = publisherWorkArea;
    }

    public long getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(long publishDate) {
        this.publishDate = publishDate;
    }

    public List<String> getWelfareList() {
        return welfareList;
    }

    public void setWelfareList(List<String> welfareList) {
        this.welfareList = welfareList;
    }

    public int getRecruitType() {
        return recruitType;
    }

    public void setRecruitType(int recruitType) {
        this.recruitType = recruitType;
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

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getFoodTypeName() {
        return foodTypeName;
    }

    public void setFoodTypeName(String foodTypeName) {
        this.foodTypeName = foodTypeName;
    }

    public String getPublisherName() {
        return publisherName;
    }

    public void setPublisherName(String publisherName) {
        this.publisherName = publisherName;
    }
}
