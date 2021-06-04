package com.thr.dao;

import com.thr.entity.User;

import java.util.List;
import java.util.Map;

/**
 * @author 唐浩荣
 * @site www.tanghaorong.com
 * @school 湖南工业职业技术学院
 * @create 2018-11-06 11:15
 */

/**
 * 用户Dao接口层
 */
public interface UserDao {

    /**
     * 用户登录
     * @param user
     * @return
     */
    public User login(User user);

    /**
     * 查询所有用户信息
     * @param map
     * @return
     */
    public List<User> list(Map<String, Object> map);

    /**
     * 获取用户记录数
     * @param map
     * @return
     */
    public Long getTotal(Map<String, Object> map);

    /**
     * 添加用户
     * @param user
     * @return
     */
    public Integer add(User user);

    /**
     * 修改用户
     * @param user
     * @return
     */
    public Integer update(User user);

    /**
     * 删除用户
     * @param id
     * @return
     */
    public Integer delete(Integer id);

}
