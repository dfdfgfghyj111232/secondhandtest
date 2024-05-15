package com.ctgu.jiujiu_usedcar.entity;

import com.ctgu.jiujiu_usedcar.dao.UserDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserTest {

    @Autowired
    UserDao userDao;

    //测试通过telenum查询到用户
    @Test
    public void getUserByTelenum(){
        System.out.println(userDao.findByTelenum("admin").toString());
    }

    @Test
    public void getUserByNickname(){
        List<User> userList = userDao.findByNicknameLike("%敖%");
        for(User user : userList)
        {
            System.out.println(user);
        }
    }

}