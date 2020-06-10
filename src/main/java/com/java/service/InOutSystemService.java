package com.java.service;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface InOutSystemService {
    boolean findLogin(String userName, String password, HttpSession session) throws Exception;

    List<Map<String, Object>> findProducts();

    boolean modifySale(Map<String, Object> paramMap);

    List<Map<String, Object>> findSale(String flag, Integer pageNum, Integer pageSize);

    int findProductById(Long pid);
}
