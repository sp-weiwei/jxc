package com.thr.service.impl;

import com.thr.dao.WareHouseDao;
import com.thr.entity.WareHouse;
import com.thr.service.WareHouseService;
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
public class WareHouseServiceImpl implements WareHouseService {

    @Autowired
    private WareHouseDao wareHouseDao;

    @Override
    public List<WareHouse> list() {
        return wareHouseDao.list();
    }

    @Override
    public Integer add(WareHouse wareHouse) {
        return wareHouseDao.add(wareHouse);
    }

    @Override
    public Integer update(WareHouse wareHouse) {
        return wareHouseDao.update(wareHouse);
    }

    @Override
    public Integer delete(Integer id) {
        return wareHouseDao.delete(id);
    }

    @Override
    public List<WareHouse> findAll() {
        return wareHouseDao.findAll();
    }
}
