package com.thr.entity;

/**
 * @author 唐浩荣
 * @site www.tanghaorong.com
 * @school 湖南工业职业技术学院
 * @create 2018-11-19 20:55
 * @name
 */
public class WareHouse {
    /**
     * 仓库编号
     */
    private Integer id;
    /**
     *仓库名字
     */
    private String name;
    /**
     *可存货数量
     */
    private Integer num;
    /**
     *状态  0：关闭 1：开放 2：维修
     */
    private Integer state;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
