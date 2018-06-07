package com.cook.service.Impl;

import com.cook.exception.AppSecretException;
import com.cook.service.ValidateCodeProcessor;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.context.request.WebRequest;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;
import java.util.concurrent.TimeUnit;

/**
 * @description: 图片验证码验证
 * @author: ziHeng
 * @create: 2018-06-07 15:36
 **/
public class ImageCodeValidate extends ValidateCodeProcessor<BufferedImage> {

    private RedisTemplate<Object,Object> redisTemplate;

    private static String keyCode = "cook.imageCodeByDeviceId:";

    private String deviceId;

    public ImageCodeValidate() {
    }

    public ImageCodeValidate(RedisTemplate<Object, Object> redisTemplate, String deviceId) {
        super(redisTemplate,keyCode);
        this.deviceId = deviceId;
        this.redisTemplate = redisTemplate;
    }

    @Override
    public String key(WebRequest request) {
        return keyCode+deviceId;
    }

    @Override
    //生成图片验证码
    public BufferedImage generateCode(ServletWebRequest request){
        int width = ServletRequestUtils.getIntParameter(request.getRequest(), "width", 67);
        int height = ServletRequestUtils.getIntParameter(request.getRequest(), "height", 23);
        int num = 4;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        Graphics g = image.getGraphics();

        Random random = new Random();

        g.setColor(getRandColor(200, 250));
        g.fillRect(0, 0, width, height);
        g.setFont(new Font("Times New Roman", Font.ITALIC, 20));
        g.setColor(getRandColor(160, 200));
        for (int i = 0; i < 155; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(12);
            int yl = random.nextInt(12);
            g.drawLine(x, y, x + xl, y + yl);
        }

        StringBuilder codeValue = new StringBuilder();
        for (int i = 0; i < num; i++) {
            String rand = String.valueOf(random.nextInt(10));
            codeValue.append(rand);
            g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
            g.drawString(rand, 13 * i + 6, 16);
        }

        g.dispose();
        //存入redis
        redisTemplate.opsForValue().set(key(request),codeValue,1, TimeUnit.MINUTES);
        return image;
    }


    /**
     * 生成随机背景条纹
     *
     * @param fc
     * @param bc
     * @return
     */
    private Color getRandColor(int fc, int bc) {
        Random random = new Random();
        if (fc > 255) {
            fc = 255;
        }
        if (bc > 255) {
            bc = 255;
        }
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }


}
