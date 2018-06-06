import com.cook.CookApplication;
import com.cook.dao.FoodTypeMapper;
import com.cook.dao.RecruitMapper;
import com.cook.entity.FoodType;
import com.cook.entity.Recruit;
import com.cook.util.RandomUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.UUID;

/**
 * @description: 数据库原始数据
 * @author: ziHeng
 * @create: 2018-05-15 11:31
 **/

@RunWith(SpringRunner.class)
@SpringBootTest(classes =CookApplication.class )
public class insertDataBase {

    @Autowired
    private RecruitMapper recruitMapper;

    @Autowired
    private FoodTypeMapper foodTypeMapper;

    @Test
    public void insertRecruit(){
        FoodType foodType = new FoodType();
        String uuid = UUID.randomUUID().toString();
        //String iconName = RandomUtil.getImgName();
        foodType.setId(uuid);
        //foodType.setIconName(iconName);
        foodType.setName("川菜");
        foodTypeMapper.insertSelective(foodType);

        //招聘表
        //Recruit recruit = new Recruit(UUID.randomUUID().toString(),);



    }

    public static void main(String[] args) {
        String uuid = UUID.randomUUID().toString();
        System.out.println(uuid);
    }




}
