package com.thr.entity;

import java.util.Date;

/**
 * @author 唐浩荣
 * @site www.tanghaorong.com
 * @school 湖南工业职业技术学院
 * @create 2018-11-16 13:19
 * @name
 */
public class SaleMonth {
    /**
     * 订购日期
     */
    private Date orderDate;
    /**
     * 销售金额
     */
    private float xiaoshou;
    /**
     * 成本金额
     */
    private float chengben;
    /**
     * 利润
     */
    private float lirun;

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public float getXiaoshou() {
        return xiaoshou;
    }

    public void setXiaoshou(float xiaoshou) {
        this.xiaoshou = xiaoshou;
    }

    public float getChengben() {
        return chengben;
    }

    public void setChengben(float chengben) {
        this.chengben = chengben;
    }

    public float getLirun() {
        return lirun;
    }

    public void setLirun(float lirun) {
        this.lirun = lirun;
    }
}
