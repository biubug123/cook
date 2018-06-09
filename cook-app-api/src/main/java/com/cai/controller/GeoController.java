package com.cai.controller;

import com.cai.dao.GeoDao;
import com.cook.entity.City;
import com.cook.entity.Street;
import com.cook.response.ApiResponse;
import com.ziheng.util.ZiHengUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ziheng.util.ZiHengUtil.getPYIndexStr;

/**
 * @description: 地理位置相关api
 * @create: 2018-05-21 15:28
 **/

@RestController
@RequestMapping("/geo")
@Api(value = "/geo",tags = "地理位置api",description = "省市区街")
public class GeoController {

    @Autowired
    private GeoDao geoDao;


    /**
     * 省列表
     * @return
     */
    @GetMapping("/listProvince")
    @ApiOperation(value = "获取省列表")
    public ApiResponse listProvince() {
        return ApiResponse.ofSuccess(geoDao.listProvince());
    }

    /**
     * 市列表
     * @param provinceCode 省份code
     * @return
     */
    @GetMapping("/listCity")
    @ApiOperation(value = "根据省code获取市列表")
    public ApiResponse listCity(@RequestParam("provinceCode")String provinceCode) {
        return ApiResponse.ofSuccess(geoDao.listCityByCode(provinceCode));
    }

    /**
     * 区列表
     * @param cityCode 市code
     * @return
     */
    @GetMapping("/listRegion")
    @ApiOperation(value = "根据市code获取区列表")
    public ApiResponse listRegion(@RequestParam("cityCode")String cityCode) {
        return ApiResponse.ofSuccess(geoDao.listRegionByCode(cityCode));
    }

    /**
     * 街列表
     * @param regionCode 区code
     * @return
     */
    @GetMapping("/listStreet")
    @ApiOperation(value = "根据区code获取街道列表")
    public ApiResponse listStreet(@RequestParam("regionCode")String regionCode) {
        List<Street> streetList = geoDao.listStreetByCode(regionCode);
        for (Street street:streetList) {
            //截除"街道"
            String streetName = StringUtils.substringBeforeLast(street.getName(),"街道");
            street.setName(streetName);
        }
        return ApiResponse.ofSuccess(streetList);
    }

    //根据城市名获取
    @GetMapping("/listCityByname")
    @ApiOperation(value = "根据市名获取城市code等相关信息")
    public ApiResponse listCityByname(@RequestParam("cityName")String cityName) {
        return ApiResponse.ofSuccess(geoDao.cityByName(cityName));
    }

    //城市首字母
    @GetMapping("/listCityByAlphabet")
    @ApiOperation(value = "根据城市首字母排序")
    public ApiResponse listCityByAlphabet() {

        List<City> cityList = geoDao.listCity();
        Map<String,List<City>> result = new HashMap<>();

        for(City city:cityList){
            //大写
            String cityName = city.getName();
            String alphaBet;
            if(cityName.equals("泸州市")){
                alphaBet = "L";
            }else if(cityName.equals("衢州市")){
                alphaBet = "Q";
            }else {
                alphaBet =  ZiHengUtil.getPYIndexStr(city.getName(),true);
            }
            if(result.containsKey(alphaBet)){
                result.get(alphaBet).add(city);
            }else {
                List<City> newList = new ArrayList<>();
                newList.add(city);
                result.put(alphaBet,newList);
            }
        }

        return ApiResponse.ofSuccess(result);
    }

}
