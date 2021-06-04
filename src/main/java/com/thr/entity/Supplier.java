package com.thr.entity;

/**
 * @author 唐浩荣
 * @site www.tanghaorong.com
 * @school 湖南工业职业技术学院
 * @create 2018-11-09 16:41
 */

/**
 * 供应商实体类
 */
public class Supplier {
    /**
     * 编号
     */
    private Integer id;
    /**
     *供应商编号
     */
    private String supplierNo;
    /**
     *负责人
     */
    private String principal;
    /**
     *供应商名字
     */
    private String name;
    /**
     *供应商所在地区
     */
    private String area;
    /**
     *信誉度
     */
    private String xyd;
    /**
     *供应商地址
     */
    private String address;
    /**
     *供应商电话
     */
    private String phone;
    /**
     *供应商邮箱
     */
    private String email;
    /**
     *备注
     */
    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSupplierNo() {
        return supplierNo;
    }

    public void setSupplierNo(String supplierNo) {
        this.supplierNo = supplierNo;
    }

    public String getPrincipal() {
        return principal;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getXyd() {
        return xyd;
    }

    public void setXyd(String xyd) {
        this.xyd = xyd;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
