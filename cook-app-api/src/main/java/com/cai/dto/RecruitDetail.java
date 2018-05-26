package com.cai.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.models.auth.In;
import lombok.Data;

import java.util.List;

@Data
public class RecruitDetail {
    private String recruitId;

    private String salary;

    private Integer recruitPeopleNum;

    private Integer recruitType;

    private String description;

    private Long publishDate;

    private Integer applyPeopleNum;

    private Integer browseCount;

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
