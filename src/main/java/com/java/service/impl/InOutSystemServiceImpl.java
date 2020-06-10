package com.java.service.impl;

import com.github.pagehelper.PageHelper;
import com.java.mapper.InOutSystemMapper;
import com.java.service.InOutSystemService;
import com.java.utils.MD5Tools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * description：
 * author：
 * date：09:51
 */
@Service
//实现事务
@Transactional(readOnly = false)
public class InOutSystemServiceImpl implements InOutSystemService {

    @Autowired
    private InOutSystemMapper inOutSystemMapper;
    /**
     * 登录
     * @param userName
     * @param password
     * @return
     */
    @Override
    public  boolean findLogin(String userName, String password, HttpSession session) throws Exception {

        //1、校验数据是否满足格式要求
        if(userName==null || password==null){
            return false;
        }
       if(!userName.matches("\\w{3,12}") || !password.matches("\\w{6,18}")){
            return false;
        }
        //2、格式正确后才通过
        String resultStr = inOutSystemMapper.selectLogin(userName, MD5Tools.md5(password));
        boolean flag = "0".equals(resultStr)?false:true;
        if(flag){
            session.setAttribute("realName",resultStr);
            session.setAttribute("userName",userName);
        }
        return flag;
    }

    @Override
    public List<Map<String, Object>> findProducts() {
        return inOutSystemMapper.selectProducts();
    }

    @Override
    public boolean modifySale(Map<String, Object> paramMap) {
        try {
            inOutSystemMapper.updateSale(paramMap);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public List<Map<String, Object>> findSale(String flag, Integer pageNum, Integer pageSize) {
        //PageHelper分页
        PageHelper.startPage(pageNum,pageSize);
        return inOutSystemMapper.selectSale(flag);
    }

    @Override
    public int findProductById(Long pid) {
        return inOutSystemMapper.selectProductById(pid);
    }

}
