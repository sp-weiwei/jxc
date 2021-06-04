package com.thr.controller;

import com.thr.entity.Order;
import com.thr.entity.PageBean;
import com.thr.entity.SaleMonth;
import com.thr.service.OrderService;
import com.thr.util.DateUtil;
import com.thr.util.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@RequestMapping(value = "/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        //true:允许输入空值，false:不能为空值
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    /**
     * 查询所有客户订单信息
     * @param page
     * @param rows
     * @param customerId
     * @param response
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "page",required = false) String page,
                       @RequestParam(value = "rows",required = false) String rows ,
                       @RequestParam(value = "customerId",required = false) String customerId,
                       HttpServletResponse response)throws Exception{
        PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("customerId",customerId);
        map.put("start",pageBean.getStart());
        map.put("size",pageBean.getPageSize());
        List<Order> orderList=orderService.list(map);
        Long total=orderService.getTotal(map);
        JSONObject result=new JSONObject();
        JsonConfig jsonConfig=new JsonConfig();
        jsonConfig.registerJsonValueProcessor(Date.class,new DateJsonValueProcessor("yyyy-MM-dd"));
        JSONArray jsonArray=JSONArray.fromObject(orderList,jsonConfig);
        result.put("rows",jsonArray);
        result.put("total",total);
        ResponseUtil.write(response,result);
        return null;
    }

    /**
     * 添加订单
     * @param s_order
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/save")
    public String save(Order s_order, HttpServletRequest request, HttpServletResponse response)throws Exception{

        s_order.setOrderNo("DD"+ DateUtil.getCurrentDateStr());
        int resultTotal=resultTotal=orderService.add(s_order);

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
     * 删除订单
     * @param ids
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    public String delete(@RequestParam("ids") String ids,HttpServletResponse response)throws Exception{
        String[] idsStr=ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
          orderService.delete(Integer.parseInt(idsStr[i]));
        }
        JSONObject result=new JSONObject();
        result.put("success",true);
        ResponseUtil.write(response,result);
        return null;
    }

    /**
     * 按月统计分析
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/saleMonth")
    public String saleMonth(HttpServletResponse response)throws Exception{
        List<SaleMonth> saleMonthList=orderService.saleMonth();
        JsonConfig jsonConfig=new JsonConfig();
        jsonConfig.registerJsonValueProcessor(Date.class,new  DateJsonValueProcessor("yyyy-MM-dd"));
        JSONArray jsonArray=JSONArray.fromObject(saleMonthList,jsonConfig);
        ResponseUtil.write(response,jsonArray);
        return null;
    }

}
