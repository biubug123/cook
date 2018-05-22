package com.cai.dto;

public class Recruit {
    private String recruitId;

    private String publisherId;

    private String jobName;

    private String foodTypeName;

    private String salary;

    private int recruitPeopleNum;

    private String ageRequire;

    private String experienceRequire;

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getFoodTypeName() {
        return foodTypeName;
    }

    public void setFoodTypeName(String foodTypeName) {
        this.foodTypeName = foodTypeName;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

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

    public int getRecruitPeopleNum() {
        return recruitPeopleNum;
    }

    public void setRecruitPeopleNum(int recruitPeopleNum) {
        this.recruitPeopleNum = recruitPeopleNum;
    }

    public String getAgeRequire() {
        return ageRequire;
    }

    public void setAgeRequire(String ageRequire) {
        this.ageRequire = ageRequire;
    }

    public String getExperienceRequire() {
        return experienceRequire;
    }

    public void setExperienceRequire(String experienceRequire) {
        this.experienceRequire = experienceRequire;
    }
}
