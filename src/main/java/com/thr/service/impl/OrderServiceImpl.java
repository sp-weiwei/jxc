package com.thr.service.impl;

import com.thr.dao.OrderDao;
import com.thr.entity.Order;
import com.thr.entity.SaleMonth;
import com.thr.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author 唐浩荣
 * @site www.tanghaorong.com
 * @school 湖南工业职业技术学院
 * @create 2018-11-12 16:34
 * @name    客户订单Service实现层
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Override
    public List<Order> list(Map<String, Object> map) {
        return orderDao.list(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return orderDao.getTotal(map);
    }

    @Override
    public int add(Order order) {
        return orderDao.add(order);
    }

    @Override
    public Integer delete(Integer id) {
        return orderDao.delete(id);
    }

    @Override
    public Integer getOrderByGoodsId(Integer id) {
        return orderDao.getOrderByGoodsId(id);
    }

    @Override
    public List<SaleMonth> saleMonth() {
        return orderDao.saleMonth();
    }
}
