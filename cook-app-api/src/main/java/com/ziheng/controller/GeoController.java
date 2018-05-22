package com.ziheng.controller;

import com.alibaba.fastjson.JSONArray;
import com.cook.dao.CityMapper;
import com.cook.dao.ProvinceMapper;
import com.cook.dao.RegionMapper;
import com.cook.dao.StreetMapper;
import com.cook.entity.City;
import com.cook.entity.Province;
import com.cook.entity.Region;
import com.cook.entity.Street;
import com.cook.response.ApiResponse;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @description: 地理位置相关api
 * @author: ziHeng
 * @create: 2018-05-21 15:28
 **/

@RestController
@RequestMapping("/geo")
public class GeoController {

    private StreetMapper streetMapper;

    private ProvinceMapper provinceMapper;

    private CityMapper cityMapper;

    private RegionMapper regionMapper;

    public GeoController(StreetMapper streetMapper, ProvinceMapper provinceMapper, CityMapper cityMapper, RegionMapper regionMapper) {
        this.streetMapper = streetMapper;
        this.provinceMapper = provinceMapper;
        this.cityMapper = cityMapper;
        this.regionMapper = regionMapper;
    }


    @PostMapping("/insertStreet")
    public ApiResponse insertStreet(@RequestBody String Json){

        List<Street> streetList = JSONArray.parseArray(Json,Street.class);

        System.out.println(streetList);

        for (int i = 0; i < streetList.size(); i++) {
            Street street = streetList.get(i);
            streetMapper.insert(street);
        }
        return null;
    }

    @PostMapping("/insertProvince")
    public ApiResponse insertProvince(@RequestBody String Json){

        List<Province> provinceList = JSONArray.parseArray(Json,Province.class);

        System.out.println(provinceList);

        for (int i = 0; i < provinceList.size(); i++) {
            Province province =provinceList.get(i);
            provinceMapper.insert(province);
        }
        return null;
    }

    @PostMapping("/insertRegion")
    public ApiResponse insertRegion(@RequestBody String Json){

        List<Region> list = JSONArray.parseArray(Json,Region.class);

        System.out.println(list);

        for (int i = 0; i < list.size(); i++) {
            Region region = list.get(i);
            regionMapper.insert(region);

        }
        return null;
    }

    @PostMapping("/insertCity")
    public ApiResponse insertCity(@RequestBody String Json){

        List<City> list = JSONArray.parseArray(Json,City.class);

        System.out.println(list);

        for (int i = 0; i < list.size(); i++) {
            City city = list.get(i);
            cityMapper.insert(city);

        }
        return null;
    }



}
