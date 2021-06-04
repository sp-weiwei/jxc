package com.thr.dao;

import com.thr.entity.Customer;

import java.util.List;
import java.util.Map;

/**
 * @author 唐浩荣
 * @site www.tanghaorong.com
 * @school 湖南工业职业技术学院
 * @create 2018-11-10 15:04
 * @name    客户Dao接口层
 */
public interface CustomerDao {

    /**
     * 查询所有客户信息
     * @param map
     * @return
     */
    public List<Customer> list(Map<String, Object> map);

    /**
     * 获取客户记录数
     * @param map
     * @return
     */
    public Long getTotal(Map<String, Object> map);

    /**
     * 添加客户
     * @param customer
     * @return
     */
    public Integer add(Customer customer);

    /**
     * 修改客户
     * @param customer
     * @return
     */
    public Integer update(Customer customer);

    /**
     * 删除客户
     * @param id
     * @return
     */
    public Integer delete(Integer id);

    /**
     * 根据id查询实体
     * @param id
     * @return
     */
    public Customer findById(Integer id);

    /**
     * 查询所有客户，用于添加订单下拉框
     * @return
     */
    public List<Customer> findAll();

}
