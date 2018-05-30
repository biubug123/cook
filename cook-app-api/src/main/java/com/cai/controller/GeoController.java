package com.cai.controller;

import com.cai.dao.GeoDao;
import com.cook.response.ApiResponse;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    public ApiResponse listProvince() {
        return ApiResponse.ofSuccess(geoDao.listProvince());
    }

    /**
     * 市列表
     * @param provinceCode 省份code
     * @return
     */
    @GetMapping("/listCity")
    public ApiResponse listCity(@RequestParam("provinceCode")String provinceCode) {
        return ApiResponse.ofSuccess(geoDao.listCity(provinceCode));
    }

    /**
     * 区列表
     * @param cityCode 市code
     * @return
     */
    @GetMapping("/listRegion")
    public ApiResponse listRegion(@RequestParam("cityCode")String cityCode) {
        return ApiResponse.ofSuccess(geoDao.listRegion(cityCode));
    }

    /**
     * 街列表
     * @param regionCode 区code
     * @return
     */
    @GetMapping("/listStreet")
    public ApiResponse listStreet(@RequestParam("regionCode")String regionCode) {
        return ApiResponse.ofSuccess(geoDao.listStreet(regionCode));
    }

}
