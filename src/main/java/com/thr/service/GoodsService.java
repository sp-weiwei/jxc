package com.thr.service;

import com.thr.entity.Goods;

import java.util.List;
import java.util.Map;

/**
 * @author 唐浩荣
 * @site www.tanghaorong.com
 * @school 湖南工业职业技术学院
 * @create 2018-11-10 15:06
 * @name    商品Service接口层
 */
public interface GoodsService {

    /**
     * 查询所有商品信息
     * @param map
     * @return
     */
    public List<Goods> list(Map<String, Object> map);

    /**
     * 获取商品记录数
     * @param map
     * @return
     */
    public Long getTotal(Map<String, Object> map);

    /**
     * 添加商品
     * @param goods
     * @return
     */
    public Integer add(Goods goods);

    /**
     * 修改商品
     * @param goods
     * @return
     */
    public Integer update(Goods goods);

    /**
     * 删除商品
     * @param id
     * @return
     */
    public Integer delete(Integer id);

    /**
     * 根据id查询商品，用于显示订单的商品
     * @param id
     * @return
     */
    public Goods findById(Integer id);

    /**
     * 查询所有商品，用于添加订单下拉框
     * @return
     */
    public List<Goods> findAll();

    /**
     * 库存报表
     * @return
     */
    public List<Goods> inventoryReport();

    /**
     * 根据仓库id查询是否能删除
     * @param id
     * @return
     */
    public Integer getGoodsByWareHouseId(Integer id);

}
