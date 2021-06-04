package com.thr.controller;

import com.thr.entity.PageBean;
import com.thr.entity.Supplier;
import com.thr.service.SupplierService;
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
 * @name    供应商Controller层
 */

@Controller
@RequestMapping(value = "/supplier")
public class SupplierController {

    @Autowired
    private SupplierService supplierService;


    /**
     * 查询所有供应商信息
     * @param page
     * @param rows
     * @param s_supplier
     * @param response
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "page",required = false) String page,
                       @RequestParam(value = "rows",required = false) String rows ,
                       Supplier s_supplier,
                       HttpServletResponse response)throws Exception{
        PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("principal", StringUtil.formatLike(s_supplier.getPrincipal()));
        map.put("name", StringUtil.formatLike(s_supplier.getName()));
        map.put("xyd", s_supplier.getXyd());
        map.put("start",pageBean.getStart());
        map.put("size",pageBean.getPageSize());
        List<Supplier> supplierList=supplierService.list(map);
        Long total=supplierService.getTotal(map);
        JSONObject result=new JSONObject();
        JSONArray jsonArray=JSONArray.fromObject(supplierList);
        result.put("rows",jsonArray);
        result.put("total",total);
        ResponseUtil.write(response,result);
        return null;
    }

    /**
     * 添加或修改供应商
     * @param s_supplier
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/save")
    public String save(Supplier s_supplier, HttpServletRequest request, HttpServletResponse response)throws Exception{
        int resultTotal=0;
        if(s_supplier.getId()==null){
            //动态生成供应商的编号
            s_supplier.setSupplierNo("GYS"+ DateUtil.getCurrentDateTimeStr());
            resultTotal=supplierService.add(s_supplier);
        }else{
            resultTotal=supplierService.update(s_supplier);
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
     * 删除供应商
     * @param ids
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    public String delete(@RequestParam("ids") String ids,HttpServletResponse response)throws Exception{
        String[] idsStr=ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
            supplierService.delete(Integer.parseInt(idsStr[i]));
        }
        JSONObject result=new JSONObject();
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
        List<Supplier> supplierList=supplierService.findAll();
        JSONArray array=new JSONArray();
        JSONArray jsonArray=JSONArray.fromObject(supplierList);
        array.addAll(jsonArray);
        ResponseUtil.write(response,array);
        return null;
    }
}
