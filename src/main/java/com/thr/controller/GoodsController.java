package com.thr.controller;

import com.thr.entity.Goods;
import com.thr.entity.PageBean;
import com.thr.service.GoodsService;
import com.thr.service.OrderService;
import com.thr.util.DateUtil;
import com.thr.util.ResponseUtil;
import com.thr.util.StringUtil;
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
@RequestMapping(value = "/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

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
     * 查询所有用户信息
     * @param page
     * @param rows
     * @param s_goods
     * @param response
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "page",required = false) String page,
                       @RequestParam(value = "rows",required = false) String rows ,
                       Goods s_goods,
                       HttpServletResponse response)throws Exception{
        PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("name", StringUtil.formatLike(s_goods.getName()));
        map.put("unit", StringUtil.formatLike(s_goods.getUnit()));
        map.put("type", StringUtil.formatLike(s_goods.getType()));
        map.put("start",pageBean.getStart());
        map.put("size",pageBean.getPageSize());
        List<Goods> goodsList=goodsService.list(map);
        Long total=goodsService.getTotal(map);
        JSONObject result=new JSONObject();
        JsonConfig jsonConfig=new JsonConfig();
        jsonConfig.registerJsonValueProcessor(Date.class,new DateJsonValueProcessor("yyyy-MM-dd"));
        JSONArray jsonArray=JSONArray.fromObject(goodsList,jsonConfig);
        result.put("rows",jsonArray);
        result.put("total",total);
        ResponseUtil.write(response,result);
        return null;
    }

    /**
     * 添加或修改供应商
     * @param s_goods
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/save")
    public String save(Goods s_goods, HttpServletRequest request, HttpServletResponse response)throws Exception{
        int resultTotal=0;
        if(s_goods.getId()==null){
            s_goods.setGoodsNo("JH"+ DateUtil.getCurrentDateTimeStr());
            resultTotal=goodsService.add(s_goods);
        }else{
            resultTotal=goodsService.update(s_goods);
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
     * 删除商品
     * @param ids
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    public String delete(@RequestParam("ids") String ids,HttpServletResponse response)throws Exception{
        String[] idsStr=ids.split(",");
        JSONObject result=new JSONObject();
        for (int i = 0; i < idsStr.length; i++) {
            if(orderService.getOrderByGoodsId(Integer.parseInt(idsStr[i]))>0){
                result.put("exist","该商品下存在订单，请删除该商品的订单后再删除该商品！");
            }else{
                goodsService.delete(Integer.parseInt(idsStr[i]));
            }
        }
        result.put("success",true);
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
        List<Goods> goodsList=goodsService.findAll();
        JSONArray array=new JSONArray();
        JSONArray jsonArray=JSONArray.fromObject(goodsList);
        array.addAll(jsonArray);
        ResponseUtil.write(response,array);
        return null;
    }

    /**
     * 库存报表
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/inventoryReport")
    public String inventoryReport(HttpServletResponse response)throws Exception{
        List<Goods> goodsList=goodsService.inventoryReport();
        JSONArray jsonArray=JSONArray.fromObject(goodsList);
        ResponseUtil.write(response,jsonArray);
        return null;
    }


}
