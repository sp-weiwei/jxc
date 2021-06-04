package com.thr.controller;

import com.thr.entity.Customer;
import com.thr.entity.PageBean;
import com.thr.service.CustomerService;
import com.thr.util.DateUtil;
import com.thr.util.ResponseUtil;
import com.thr.util.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 唐浩荣
 * @site www.tanghaorong.com
 * @school 湖南工业职业技术学院
 * @create 2018-11-06 11:18
 */

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    /**
     * 查询所有客户信息
     * @param page
     * @param rows
     * @param s_customer
     * @param response
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "page",required = false) String page,
                       @RequestParam(value = "rows",required = false) String rows ,
                       Customer s_customer,
                       HttpServletResponse response)throws Exception{
        PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("name", StringUtil.formatLike(s_customer.getName()));
        map.put("area", StringUtil.formatLike(s_customer.getArea()));
        map.put("start",pageBean.getStart());
        map.put("size",pageBean.getPageSize());
        List<Customer> customerList=customerService.list(map);
        Long total=customerService.getTotal(map);
        JSONObject result=new JSONObject();
        JSONArray jsonArray=JSONArray.fromObject(customerList);
        result.put("rows",jsonArray);
        result.put("total",total);
        ResponseUtil.write(response,result);
        return null;
    }

    /**
     * 添加或修改客户
     * @param s_customer
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/save")
    public String save(Customer s_customer, HttpServletRequest request, HttpServletResponse response)throws Exception{
        int resultTotal=0;
        if(s_customer.getId()==null){
            //动态生成客户的编号
            s_customer.setCustomerNo("KH"+ DateUtil.getCurrentDateTimeStr());
            resultTotal=customerService.add(s_customer);
        }else{
            resultTotal=customerService.update(s_customer);
        }
        JSONObject result=new JSONObject();
        if(resultTotal>0){
            result.put("success",true);
        }else{
            result.put("success",false);
        }
        ResponseUtil.write(response,result);
        return null;
    }

    /**
     * 删除客户
     * @param ids
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    public String delete(@RequestParam("ids") String ids,HttpServletResponse response)throws Exception{
        String[] idsStr=ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
            customerService.delete(Integer.parseInt(idsStr[i]));
        }
        JSONObject result=new JSONObject();
        result.put("success",true);
        ResponseUtil.write(response,result);
        return null;
    }

    /**
     * 通过id查询实体
     * @param id
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findById")
    public String findById(@RequestParam(value = "id") String id,HttpServletResponse response)throws Exception{
        Customer customer=customerService.findById(Integer.parseInt(id));
        JSONObject result=JSONObject.fromObject(customer);
        ResponseUtil.write(response,result);
        return null;
    }

    /**
     * 添加商品时的下拉框，选择供应商名称
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findAll")
    public String findAll(HttpServletResponse response)throws Exception{
        List<Customer> customerList=customerService.findAll();
        JSONArray array=new JSONArray();
        JSONArray jsonArray=JSONArray.fromObject(customerList);
        array.addAll(jsonArray);
        ResponseUtil.write(response,array);
        return null;
    }
}
