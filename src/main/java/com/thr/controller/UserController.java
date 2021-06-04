package com.thr.controller;

import com.thr.entity.PageBean;
import com.thr.entity.User;
import com.thr.service.UserService;
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
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 唐浩荣
 * @site www.tanghaorong.com
 * @school 湖南工业职业技术学院
 * @create 2018-11-06 11:18
 */

/**
 * 用户Controller层
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 用户登录
     * @param user
     * @param request
     * @return
     */
    @RequestMapping(value = "/login")
    public  String  login(User user, HttpServletRequest request){
            User resultUser=userService.login(user);
            if(resultUser==null){
                request.setAttribute("user",user);
                request.setAttribute("errorMsg","用户名或密码错误！");
                return "login";
            }else{
                HttpSession session=request.getSession();
                session.setAttribute("currentUser",resultUser);
                return "redirect:/page/main.jsp";
            }
    }

    /**
     * 查询所有用户信息
     * @param page
     * @param rows
     * @param s_user
     * @param response
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "page",required = false) String page,
                       @RequestParam(value = "rows",required = false) String rows ,
                       User s_user,
                       HttpServletResponse response)throws Exception{
        PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("userName", StringUtil.formatLike(s_user.getUserName()));
        map.put("start",pageBean.getStart());
        map.put("size",pageBean.getPageSize());
        List<User> userList=userService.list(map);
        Long total=userService.getTotal(map);
        JSONObject result=new JSONObject();
        JSONArray jsonArray=JSONArray.fromObject(userList);
        result.put("rows",jsonArray);
        result.put("total",total);
        ResponseUtil.write(response,result);
        return null;
    }

    /**
     * 添加或修改用户
     * @param s_user
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/save")
    public String save(User s_user, HttpServletRequest request, HttpServletResponse response)throws Exception{
        int resultTotal=0;
        if(s_user.getId()==null){
            resultTotal=userService.add(s_user);
        }else{
            resultTotal=userService.update(s_user);
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
     * 删除用户
     * @param ids
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    public String delete(@RequestParam("ids") String ids,HttpServletResponse response)throws Exception{
        String[] idsStr=ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
            userService.delete(Integer.parseInt(idsStr[i]));
        }
        JSONObject result=new JSONObject();
        result.put("success",true);
        ResponseUtil.write(response,result);
        return null;
    }

    /**
     * 修改用户密码
     * @param user
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/modifyPassword")
    public String modifyPassword(User s_user,HttpServletResponse response) throws Exception{
        int resultTotal=userService.update(s_user);
        JSONObject jsonObject=new JSONObject();
        if(resultTotal>0) {
            jsonObject.put("success", true);
        }else {
            jsonObject.put("success", false);
        }
        ResponseUtil.write(response, jsonObject);
        return null;
    }

    /**
     * 退出登录
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session)throws Exception{
        session.invalidate();
        return "redirect:/login.jsp";
    }
}
