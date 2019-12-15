package com.infini.b2e.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.infini.b2e.entity.MstAirport;
import com.infini.b2e.entity.MstCarrier;
import com.infini.b2e.entity.RequestFlight;
import com.infini.b2e.entity.RequestItem;
import com.infini.b2e.service.MstAirportService;
import com.infini.b2e.service.MstCarrierService;
import com.infini.b2e.service.RequestItemService;
import com.infini.b2e.utils.DateUtils;
import com.infini.b2e.utils.PaginationUtils;

@Controller
@RequestMapping(value = { "/inf_admin" })
@Transactional
public class RequestItemController extends BaseController {

    private final int maxResult = 50;

    private final int offset = 4;

    @Autowired
    private RequestItemService requestItemService;

    @Autowired
    private MstAirportService mstAirportService;

    @Autowired
    private MstCarrierService mstCarrierService;

    /**
     * @param model
     * @param page
     * @param date_from
     * @param date_to
     * @param searchKey
     * @return
     */
    @RequestMapping(value = { "/history" }, method = RequestMethod.GET)
    public ModelAndView listRequetItems(ModelMap model, @RequestParam(name = "page", defaultValue = "1") int page,
            @RequestParam(name = "date_from", required = false) String date_from, @RequestParam(name = "date_to", required = false) String date_to,
            @RequestParam(name = "keysearch", required = false) String searchKey) {
        initView("layout");
        if (page < 0) {
            page = 1;
        }
        float totalRecord = requestItemService.countAllRequestItem(page, date_from, date_to, searchKey);
        int totalPage = (int) Math.ceil(totalRecord / maxResult);
        if (page > totalPage) {
            page = 1;
            totalRecord = requestItemService.countAllRequestItem(page, date_from, date_to, searchKey);
        }

        PaginationUtils.pagination(page, totalPage, view, offset);
        StringBuilder paramSearch = new StringBuilder("");
        if (date_from != null) {
            paramSearch.append("&date_from=").append(date_from).append("&date_to=").append(date_to);
        }
        if (searchKey != null) {
            paramSearch.append("&keysearch=").append(searchKey);
        }
        view.addObject("searchParam", paramSearch);
        view.addObject("listRequestItem", requestItemService.getAllRequestItem(page, date_from, date_to, searchKey, maxResult));
        view.addObject("view", "history/index.html");
        view.addObject("totalRecords", (int) totalRecord);
        if (date_from == null && date_to == null) {
            view.addObject("currentTime",DateUtils.getDateTime(new Date()));
        }
        return view;
    }

    /**
     * @param request_id
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = { "/history/detail/{request_id}" }, method = RequestMethod.GET)
    public ModelAndView detailRequestItem(@PathVariable("request_id") String request_id) throws Exception {
        initView("layout");
        RequestItem requestItem = requestItemService.getRequestItemByRequestId(request_id);
        Set<MstAirport> listMstAirport = new HashSet<MstAirport>();
        Set<MstCarrier> listMstCarrier = new HashSet<MstCarrier>();
        for (RequestFlight requestFlight : requestItem.getListRequestFlight()) {
            listMstAirport.add(mstAirportService.getMstAirportByAirportCode(requestFlight.getDeparture_airport()));
            listMstAirport.add(mstAirportService.getMstAirportByAirportCode(requestFlight.getArrival_airport()));
            listMstCarrier.add(mstCarrierService.getMstCarrierByCarrierCode(requestFlight.getCarrier()));
        }
        List<ArrayList<RequestFlight>> listOfListRequestFlight = new ArrayList<ArrayList<RequestFlight>>();
        List<RequestFlight> listRequestFlight = requestItem.getListRequestFlight();
        
        for(int i=0; i< listRequestFlight.size(); i++) {
            listRequestFlight.get(i).setDateWeeksFrom(DateUtils.getWeekDays(listRequestFlight.get(i).getDeparture_date()));
            listRequestFlight.get(i).setDateWeeksTo(DateUtils.getWeekDays(listRequestFlight.get(i).getArrival_date()));
            if(listRequestFlight.get(i).getConnection_indicator() == 0) {
                List<RequestFlight> listOfOneRequestFlight = new  ArrayList<RequestFlight>();
                listOfOneRequestFlight.add(listRequestFlight.get(i));
                for(int j= i+1; j < listRequestFlight.size() ; j++) {
                    if(listRequestFlight.get(j).getConnection_indicator() == 1) {
                        listOfOneRequestFlight.add(listRequestFlight.get(j));
                    }else {
                        break;
                    }
                }
                listOfListRequestFlight.add((ArrayList<RequestFlight>) listOfOneRequestFlight);
            }
        }
        view.addObject("listMstAirport", listMstAirport);
        view.addObject("listMstCarrier", listMstCarrier);
        view.addObject("listOfListRequestFlight", listOfListRequestFlight);
        view.addObject("requestItem", requestItem);
        view.addObject("view", "history/detail.html");
        return view;
    }

}
