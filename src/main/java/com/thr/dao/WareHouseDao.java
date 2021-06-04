package com.thr.dao;

import com.thr.entity.WareHouse;

import java.util.List;
import java.util.Map;

/**
 * @author 唐浩荣
 * @site www.tanghaorong.com
 * @school 湖南工业职业技术学院
 * @create 2018-11-10 15:04
 * @name    仓库信息Dao接口层
 */
public interface WareHouseDao {

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
     * 根据id查询实体
     * @param id
     * @return
     */
    public WareHouse findById(Integer id);

    /**
     * 查询所有仓库信息，用于添加商品下拉框
     * @return
     */
    public List<WareHouse> findAll();

}
