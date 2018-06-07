package com.cai.dao;

import com.cook.entity.City;
import com.cook.entity.Province;
import com.cook.entity.Region;
import com.cook.entity.Street;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GeoDao {
    List<Province> listProvince();

    List<City> listCityByCode(@Param("provinceCode") String provinceCode);

    List<Region> listRegionByCode(@Param("cityCode") String cityCode);

    List<Street> listStreetByCode(@Param("regionCode") String regionCode);

    //根据城市名获取其Code
    List<City> listCityByName(@Param("cityName") String cityName);

    List<City> listCity();


}
