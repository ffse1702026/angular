package com.infini.ccache.api.endpoint;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.ws.server.endpoint.annotation.Endpoint;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;
import org.springframework.ws.server.endpoint.annotation.RequestPayload;
import org.springframework.ws.server.endpoint.annotation.ResponsePayload;
import org.springframework.ws.transport.context.TransportContext;
import org.springframework.ws.transport.context.TransportContextHolder;
import org.springframework.ws.transport.http.HttpServletConnection;
import javax.xml.bind.JAXBElement;

import com.infini.ccache.api.common.constant.ConstMisc;
import com.infini.ccache.api.entity.FileInfo;
import com.infini.ccache.api.entity.UserInfo;
import com.infini.ccache.api.generated.INFINICalendarCacheRQ;
import com.infini.ccache.api.generated.INFINICalendarCacheRQ.ZipFileInformation;
import com.infini.ccache.api.generated.INFINICalendarCacheRS;
import com.infini.ccache.api.generated.INFINICalendarCacheRS.FileData;
import com.infini.ccache.api.generated.INFINICalendarCacheRS.FileData.FilePath;
import com.infini.ccache.api.generated.INFINICalendarCacheRS.Message;
import com.infini.ccache.api.properties.AppProperties;
import com.infini.ccache.api.service.InformationFilesService;
import com.infini.ccache.api.service.LogAccessService;
import com.infini.ccache.api.service.UserService;

/**
 * The Class DownloadFilesEndpoint.
 */
@Endpoint
public class DownloadFilesEndpoint {

    /** The app. */
    @Autowired
    AppProperties app;

    /** The user service. */
    @Autowired
    UserService userService;

    /** The log access service. */
    @Autowired
    LogAccessService logAccessService;

    /** The information files service. */
    @Autowired
    InformationFilesService informationFilesService;

    /**
     * Process course details request.
     *
     * @param requestApi the request api
     * @return the INFINI calendar cache RS
     * @throws Exception 
     */
    @PayloadRoot(namespace = "/", localPart = ConstMisc.BEER_REQUEST_LOCAL_PART)
    @ResponsePayload
    public JAXBElement<INFINICalendarCacheRS> processCourseDetailsRequest(@RequestPayload JAXBElement<INFINICalendarCacheRQ> requestApi, HttpServletRequest request) throws Exception {
        
    	
    	INFINICalendarCacheRS response = new INFINICalendarCacheRS();
        Message message = new Message();
        UserInfo userInfo = new UserInfo();

        String id = requestApi.getPOS().getUserAuth().getID();
        String password = requestApi.getPOS().getUserAuth().getPassword();
        String result = ConstMisc.RESULT_OK;
        HttpServletRequest re = getHttpServletRequest();
        String ip = re.getRemoteAddr();

        try {
            
            userInfo = userService.isExistUser(id);
            response.setVersion(ConstMisc.VERSION);
            if (userInfo == null) {

                userInfo = new UserInfo();
                userInfo.setId(id);
                userInfo.setPcc(ConstMisc.BLANK);
                
                // set message Authentication Error E1001
                message.setCode(ConstMisc.E1001);
                message.setText(ConstMisc.AUTHEN_ERROR);
                response.getMessage().add(message);
                throw new Exception();

            } else if(userInfo.getEnablePassword() == 1 && !userInfo.getPassword().equals(password)) {
            	
                // set message Authentication Error E1002
                message.setCode(ConstMisc.E1002);
                message.setText(ConstMisc.AUTHEN_ERROR);
                response.getMessage().add(message);
                throw new Exception();

            } else if (userInfo.getEnablePassword() == 0) {
                boolean checkIp = false;
                ArrayList listIp = new ArrayList(Arrays.asList(userInfo.getIp().replaceAll(" ", "").split(";")));
                outerloop : for (int i=0; i<listIp.size(); i++) {
                    if (ip.equals(listIp.get(i))) {
                        checkIp = true;
                        break outerloop;
                    }
                }
                if(!checkIp) {
                    // set message Authentication Error E1002
                    message.setCode(ConstMisc.E1002);
                    message.setText(ConstMisc.AUTHEN_ERROR);
                    response.getMessage().add(message);
                    throw new Exception();
                }
                
            }
            userInfo.setToken(UUID.randomUUID().toString());
            userInfo.setTimeCreateToken(new Date());
            userService.updateUserInfoByToken(userInfo);
            String fileCount = null;
            // get file path
            ZipFileInformation zipFileInformation = requestApi.getZipFileInformation();
            if (zipFileInformation != null) {
                fileCount = zipFileInformation.getFileCount();
            }
            if (fileCount == null) {
                fileCount = app.getZipFileInformationFileCount();
            }

            List<FileInfo> infoFiles = new ArrayList<FileInfo>();

            infoFiles = informationFilesService.getInfoFiles(fileCount);
            if (infoFiles.isEmpty()) {
                message.setCode(ConstMisc.E2001);
                message.setText(ConstMisc.NO_DATA);
                response.getMessage().add(message);
                throw new Exception();
            }
            FileData fileData = new FileData();
            for (FileInfo infoFile : infoFiles) {
                FilePath filePath = new FilePath();
                filePath.setCreateDateTime(infoFile.getDateTime());
                filePath.setValue(infoFile.getFilePath() + "?token=" + userInfo.getToken());
                fileData.getFilePath().add(filePath);
            }
            response.getFileData().add(fileData);
        } catch (Exception e) {
            if (message.getCode() == null) {
                message.setCode(ConstMisc.E9999);
                message.setText(ConstMisc.EXCEPTION_ERROR);
                response.getMessage().add(message);
            }
            result = ConstMisc.RESULT_NG;
        } finally {
            try {
                userInfo.setIp(ip);
                logAccessService.setAccessLog(userInfo, result);
            } catch (Exception e) {
                throw e;
            }
        }
        return response;
    }

    /**
     * Gets the http servlet request.
     *
     * @return the http servlet request
     */
    protected HttpServletRequest getHttpServletRequest() {
        TransportContext ctx = TransportContextHolder.getTransportContext();
        return (null != ctx) ? ((HttpServletConnection) ctx.getConnection()).getHttpServletRequest() : null;
    }

    /**
     * Gets the http header value.
     *
     * @param headerName the header name
     * @return the http header value
     */
    protected String getHttpHeaderValue(final String headerName) {
        HttpServletRequest httpServletRequest = getHttpServletRequest();
        return (null != httpServletRequest) ? httpServletRequest.getHeader(headerName) : null;
    }

}