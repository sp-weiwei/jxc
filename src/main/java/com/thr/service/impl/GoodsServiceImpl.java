package com.thr.service.impl;

import com.thr.dao.GoodsDao;
import com.thr.entity.Goods;
import com.thr.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author 唐浩荣
 * @site www.tanghaorong.com
 * @school 湖南工业职业技术学院
 * @create 2018-11-10 15:07
 * @name    商品Service实现层
 */
@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsDao goodsDao;

    @Override
    public List<Goods> list(Map<String, Object> map) {
        return goodsDao.list(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return goodsDao.getTotal(map);
    }

    @Override
    public Integer add(Goods goods) {
        return goodsDao.add(goods);
    }

    @Override
    public Integer update(Goods goods) {
        return goodsDao.update(goods);
    }

    @Override
    public Integer delete(Integer id) {
        return goodsDao.delete(id);
    }

    @Override
    public Goods findById(Integer id) {
        return goodsDao.findById(id);
    }

    @Override
    public List<Goods> findAll() {
        return goodsDao.findAll();
    }

    @Override
    public List<Goods> inventoryReport() {
        return goodsDao.inventoryReport();
    }

    @Override
    public Integer getGoodsByWareHouseId(Integer id) {
        return goodsDao.getGoodsByWareHouseId(id);
    }
}
