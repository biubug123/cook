package com.cai.dto;

import java.util.List;

public class RecruitDetail {
    private String id;

    private String salary;

    private int recruitPeopleNum;

    private int recruitType;

    private String description;

    private long publishDate;

    private int applyPeopleNum;

    private int browserCount;

    private String publisherId;

    private String foodTypeId;

    private List<String> welfareIdList;

    private String jobId;

    private String education;

    private String experienceRequire;

    private String ageRequire;

    private String publisherName;

    private String contactWay;

    private String workArea;

    private String address;

    public String getPublisherName() {
        return publisherName;
    }

    public void setPublisherName(String publisherName) {
        this.publisherName = publisherName;
    }

    public String getContactWay() {
        return contactWay;
    }

    public void setContactWay(String contactWay) {
        this.contactWay = contactWay;
    }

    public String getWorkArea() {
        return workArea;
    }

    public void setWorkArea(String workArea) {
        this.workArea = workArea;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public int getRecruitPeopleNum() {
        return recruitPeopleNum;
    }

    public void setRecruitPeopleNum(int recruitPeopleNum) {
        this.recruitPeopleNum = recruitPeopleNum;
    }

    public int getRecruitType() {
        return recruitType;
    }

    public void setRecruitType(int recruitType) {
        this.recruitType = recruitType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(long publishDate) {
        this.publishDate = publishDate;
    }

    public int getApplyPeopleNum() {
        return applyPeopleNum;
    }

    public void setApplyPeopleNum(int applyPeopleNum) {
        this.applyPeopleNum = applyPeopleNum;
    }

    public int getBrowserCount() {
        return browserCount;
    }

    public void setBrowserCount(int browserCount) {
        this.browserCount = browserCount;
    }

    public String getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(String publisherId) {
        this.publisherId = publisherId;
    }

    public String getFoodTypeId() {
        return foodTypeId;
    }

    public void setFoodTypeId(String foodTypeId) {
        this.foodTypeId = foodTypeId;
    }

    public List<String> getWelfareIdList() {
        return welfareIdList;
    }

    public void setWelfareIdList(List<String> welfareIdList) {
        this.welfareIdList = welfareIdList;
    }

    public String getJobId() {
        return jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getExperienceRequire() {
        return experienceRequire;
    }

    public void setExperienceRequire(String experienceRequire) {
        this.experienceRequire = experienceRequire;
    }

    public String getAgeRequire() {
        return ageRequire;
    }

    public void setAgeRequire(String ageRequire) {
        this.ageRequire = ageRequire;
    }
}
