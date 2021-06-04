package com.thr.service.impl;

import com.thr.dao.CustomerDao;
import com.thr.entity.Customer;
import com.thr.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author 唐浩荣
 * @site www.tanghaorong.com
 * @school 湖南工业职业技术学院
 * @create 2018-11-12 16:34
 * @name    客户Service实现层
 */
@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao customerDao;

    @Override
    public List<Customer> list(Map<String, Object> map) {
        return customerDao.list(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return customerDao.getTotal(map);
    }

    @Override
    public Integer add(Customer customer) {
        return customerDao.add(customer);
    }

    @Override
    public Integer update(Customer customer) {
        return customerDao.update(customer);
    }

    @Override
    public Integer delete(Integer id) {
        return customerDao.delete(id);
    }

    @Override
    public Customer findById(Integer id) {
        return customerDao.findById(id);
    }

    @Override
    public List<Customer> findAll() {
        return customerDao.findAll();
    }
}
