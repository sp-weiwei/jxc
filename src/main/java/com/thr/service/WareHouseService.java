package com.thr.service;

import com.thr.entity.Goods;
import com.thr.entity.WareHouse;

import java.util.List;
import java.util.Map;

/**
 * @author 唐浩荣
 * @site www.tanghaorong.com
 * @school 湖南工业职业技术学院
 * @create 2018-11-10 15:06
 * @name    商品Service接口层
 */
public interface WareHouseService {

    /**
     * 查询所有仓库信息信息
     * @return
     */
    public List<WareHouse> list();

    /**
     * 添加仓库信息
     * @param wareHouse
     * @return
     */
    public Integer add(WareHouse wareHouse);

    /**
     * 修改仓库信息
     * @param wareHouse
     * @return
     */
    public Integer update(WareHouse wareHouse);

    /**
     * 删除仓库信息
     * @param id
     * @return
     */
    public Integer delete(Integer id);

    /**
     * 查询所有仓库信息，用于添加商品下拉框
     * @return
     */
    public List<WareHouse> findAll();
}
