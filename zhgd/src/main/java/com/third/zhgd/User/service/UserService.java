package com.third.zhgd.User.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.third.zhgd.User.entity.User;

import java.util.List;

/**
* <p>
    * 用户表 服务类接口
    * </p>
*
* @author Csk
* @since 2024-04-21
*/
public interface UserService extends IService<User> {


    Boolean addOrUpdate(User user);
    void deleteByIds(String ids);
    List<User> list();
    Page<User> page(Integer pageNum,Integer pageSize);

}