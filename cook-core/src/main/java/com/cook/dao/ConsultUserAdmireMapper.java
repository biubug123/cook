package com.cook.dao;

import com.cook.entity.ConsultUserAdmire;
import org.springframework.stereotype.Repository;

@Repository
public interface ConsultUserAdmireMapper {
    int insert(ConsultUserAdmire record);

    int insertSelective(ConsultUserAdmire record);
}