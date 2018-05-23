package com.cai.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.util.List;

@Data
public class RecruitDetail {
    private String recruitId;

    private String salary;

    private int recruitPeopleNum;

    private int recruitType;

    private String description;

    private long publishDate;

    private int applyPeopleNum;

    private int browseCount;

    private String publisherId;

    private String foodTypeId;

    private String jobId;

    private String education;

    private String experienceRequire;

    private String ageRequire;

    private String publisherName;

    private String contactWay;

    private String workArea;

    private String address;

    private String[] welfareList;

    @JsonIgnore
    private String welfareIdList;


}
