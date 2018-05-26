package com.cai.controller;

import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description: 地理位置相关api
 * @create: 2018-05-21 15:28
 **/

@RestController
@RequestMapping("/geo")
@Api(value = "/geo",tags = "地理位置api",description = "省市区街")
public class GeoController {



}
