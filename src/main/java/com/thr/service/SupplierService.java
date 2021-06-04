package com.thr.service;

import com.thr.entity.Supplier;
import java.util.List;
import java.util.Map;

/**
 * @author 唐浩荣
 * @site www.tanghaorong.com
 * @school 湖南工业职业技术学院
 * @create 2018-11-06 11:16
 * @name    供应商Service接口层
 */
public interface SupplierService {

    /**
     * 查询所有供应商信息
     * @param map
     * @return
     */
    public List<Supplier> list(Map<String, Object> map);

    /**
     * 获取供应商记录数
     * @param map
     * @return
     */
    public Long getTotal(Map<String, Object> map);

    /**
     * 添加供应商
     * @param supplier
     * @return
     */
    public Integer add(Supplier supplier);

    /**
     * 修改供应商
     * @param supplier
     * @return
     */
    public Integer update(Supplier supplier);

    /**
     * 删除供应商
     * @param id
     * @return
     */
    public Integer delete(Integer id);

    /**
     * 查询所有供应商名称，用于添加商品的下拉框
     * @return
     */
    public List<Supplier> findAll();
}
