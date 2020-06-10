package com.java.controller;

import com.github.pagehelper.PageInfo;
import com.java.service.InOutSystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class LoginController {
        @Autowired
        private InOutSystemService inOutSystemService;

        /**
         * 登陆
         * @param userName
         * @param password
         * @return
         */
        @RequestMapping("/login")
        public @ResponseBody
        boolean login(String userName, String password, HttpSession session){
            try {
                return  inOutSystemService.findLogin(userName, password,session);
            } catch (Exception e) {
                return false;
            }
        }

        /**
         * 获取所有产品信息
         * @return
         */
        @RequestMapping("/getProducts")
        public  @ResponseBody
        List<Map<String,Object>> getProducts(){
            return inOutSystemService.findProducts();
        }

        /**
         * 添加销售记录
         * @param pid
         * @param quantity
         * @param cost
         * @param session
         * @return
         */
        @RequestMapping("/updateSale")
        public @ResponseBody boolean updateSale(Long pid,Integer quantity,Float cost,HttpSession session){
            Map<String,Object> paramMap = new HashMap<String,Object>();
            paramMap.put("pid",pid);
            paramMap.put("userName",(String)session.getAttribute("userName"));
            paramMap.put("num",quantity);
            paramMap.put("cost",cost);
            return inOutSystemService.modifySale(paramMap);
        }

        /**
         * 跳转到销售列表页面，同时传递数据过去
         */
        @RequestMapping("/toSaleList")
        public String toSaleList(@RequestParam(defaultValue = "1") String flag,
                                 @RequestParam(defaultValue = "1") Integer pageNum,
                                 @RequestParam(defaultValue = "5") Integer pageSize,
                                 Model model){
            List<Map<String, Object>> saleList = inOutSystemService.findSale(flag, pageNum, pageSize);
            PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(saleList);
            model.addAttribute("pageInfo",pageInfo);
            model.addAttribute("flag",flag);
            return "saleList.jsp";
        }

        /**
         * 跳转到商品库存查询页面，并且带商品列表信息过去
         * @return
         */
        @RequestMapping("/toShowNum")
        public String toShowNum(Model model){
            List<Map<String, Object>> productList = inOutSystemService.findProducts();
            model.addAttribute("productList",productList);
            return "showNum.jsp";
        }

        /**
         * 根据商品id查询出对应的库存数量
         * @param pid
         * @return
         */
        @RequestMapping("/getNumByPid")
        public @ResponseBody int getNumByPid(Long pid){
            return inOutSystemService.findProductById(pid);
        }

        /**
         * 退出登录
         * @return
         */
        @RequestMapping("/logout")
        public String logout(HttpSession session){
            session.invalidate();
            return "redirect:/pages/login.jsp";
        }
    }
