package com.cai.dao;

import com.cook.entity.City;
import com.cook.entity.Province;
import com.cook.entity.Region;
import com.cook.entity.Street;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GeoDao {
    List<Province> listProvince();

    List<City> listCity(@Param("provinceCode") String provinceCode);

    List<Region> listRegion(@Param("cityCode") String cityCode);

    List<Street> listStreet(@Param("regionCode") String regionCode);
}
