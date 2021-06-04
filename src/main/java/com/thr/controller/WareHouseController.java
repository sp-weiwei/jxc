package com.thr.controller;

import com.thr.entity.Supplier;
import com.thr.entity.WareHouse;
import com.thr.entity.PageBean;
import com.thr.service.GoodsService;
import com.thr.service.WareHouseService;
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
@RequestMapping(value = "/wareHouse")
public class WareHouseController {

    @Autowired
    private WareHouseService wareHouseService;

    @Autowired
    private GoodsService goodsService;

    /**
     * 查询所有用户信息
     * @param s_wareHouse
     * @param response
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(WareHouse s_wareHouse,
                       HttpServletResponse response)throws Exception{
        List<WareHouse> wareHouseList=wareHouseService.list();
        JSONObject result=new JSONObject();
        JSONArray jsonArray=JSONArray.fromObject(wareHouseList);
        result.put("rows",jsonArray);
        ResponseUtil.write(response,result);
        return null;
    }

    /**
     * 添加或修改供应商
     * @param s_wareHouse
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/save")
    public String save(WareHouse s_wareHouse, HttpServletRequest request, HttpServletResponse response)throws Exception{
        int resultTotal=0;
        if(s_wareHouse.getId()==null){
            resultTotal=wareHouseService.add(s_wareHouse);
        }else{
            resultTotal=wareHouseService.update(s_wareHouse);
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
            if(goodsService.getGoodsByWareHouseId(Integer.parseInt(idsStr[i]))>0){
                result.put("exist","仓库下存在商品，请移除后再删除该仓库！");
            }else{
               wareHouseService.delete(Integer.parseInt(idsStr[i]));
            }
        }
        result.put("success",true);
        ResponseUtil.write(response,result);
        return null;
    }

    /**
     * 添加商品时的下拉框，选择仓库
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findAll")
    public String findAll(HttpServletResponse response)throws Exception{
        List<WareHouse> wareHouseList=wareHouseService.findAll();
        JSONArray array=new JSONArray();
        JSONArray jsonArray=JSONArray.fromObject(wareHouseList);
        array.addAll(jsonArray);
        ResponseUtil.write(response,array);
        return null;
    }
}
