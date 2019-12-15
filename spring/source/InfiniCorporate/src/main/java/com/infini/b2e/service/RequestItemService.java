/**
 * 
 */
package com.infini.b2e.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infini.b2e.dao.RequestItemDAO;
import com.infini.b2e.entity.RequestItem;

/**
 * @author nguyenxuansang
 *
 */
@Service
public class RequestItemService {
    @Autowired
    private RequestItemDAO requestItemDAO;

    public List<RequestItem> getAllRequestItem(int page, String date_from, String date_to, String searchKey, int maxResult) {
        return requestItemDAO.getAllRequestItem(page, date_from, date_to, searchKey, maxResult);
    }
    
    public long countAllRequestItem(int page, String date_from, String date_to, String searchKey){
        return requestItemDAO.countAllRequestItem(page, date_from, date_to, searchKey);
    }
    
    public RequestItem getRequestItemByRequestId(String request_id) {
        return requestItemDAO.getRequestItemByRequestId(request_id);
    }
}
