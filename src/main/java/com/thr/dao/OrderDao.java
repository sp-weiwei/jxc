package com.thr.dao;

import com.thr.entity.Order;
import com.thr.entity.SaleMonth;

import java.util.List;
import java.util.Map;

/**
 * @author 唐浩荣
 * @site www.tanghaorong.com
 * @school 湖南工业职业技术学院
 * @create 2018-11-10 15:04
 * @name    客户订单Dao接口层
 */
public interface OrderDao {

    /**
     * 查询所有客户订单信息
     * @param map
     * @return
     */
    public List<Order> list(Map<String, Object> map);

    /**
     * 获取客户订单记录数
     * @param map
     * @return
     */
    public Long getTotal(Map<String, Object> map);

    /**
     * 添加订单
     * @param order
     * @return
     */
    public int add(Order order);

    /**
     *
     * @param id
     * @return
     */
    public Integer delete(Integer id);

    /**
     * 根据商品id查询是否能删除
     * @param id
     * @return
     */
    public Integer getOrderByGoodsId(Integer id);

    /**
     * 按月统计分析
     * @return
     */
    public List<SaleMonth>  saleMonth();

}
