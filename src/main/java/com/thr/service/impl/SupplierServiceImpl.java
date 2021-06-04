package com.thr.service.impl;

import com.thr.dao.SupplierDao;
import com.thr.entity.Supplier;
import com.thr.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author 唐浩荣
 * @site www.tanghaorong.com
 * @school 湖南工业职业技术学院
 * @create 2018-11-09 17:08
 * @name    供应商Service实现层
 */
@Service
public class SupplierServiceImpl implements SupplierService {

    @Autowired
    private SupplierDao supplierDao;

    @Override
    public List<Supplier> list(Map<String, Object> map) {
        return supplierDao.list(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return supplierDao.getTotal(map);
    }

    @Override
    public Integer add(Supplier supplier) {
        return supplierDao.add(supplier);
    }

    @Override
    public Integer update(Supplier supplier) {
        return supplierDao.update(supplier);
    }

    @Override
    public Integer delete(Integer id) {
        return supplierDao.delete(id);
    }

    @Override
    public List<Supplier> findAll() {
        return supplierDao.findAll();
    }
}
