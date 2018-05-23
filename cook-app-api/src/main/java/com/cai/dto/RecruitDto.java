package com.cai.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;


@Data
public class RecruitDto implements Comparable<RecruitDto> {

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

    @JsonIgnore
    private String welfare;

    private String[] welfareList;



    @Override
    public int compareTo(RecruitDto o) {
        if(this.publisherId.equals(o.publisherId)){
            o.jobName=o.jobName+"|"+this.jobName;
            o.isMoreJob = 1;
            return 0;
        }
        //降序
        return (int)(o.publishDate - this.publishDate);
    }
}
