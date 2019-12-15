package com.infini.ccache.api.controller;

import java.util.Date;
import javax.xml.bind.JAXBElement;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.infini.ccache.api.properties.AppProperties;
import com.infini.ccache.api.service.S3Wrapper;
import com.infini.ccache.api.service.UserService;

/**
 * The Class DownloadFilesController.
 */
@RestController
public class DownloadFilesController {

    /** The app. */
    @Autowired
    AppProperties app;
    
    /** The s 3. */
    @Autowired
    S3Wrapper s3;
    
    @Autowired
    UserService userService;
    
    @Value("${time.destroy.session}")
    private int TIME_TO_DESTROY_TOKEN;

    /**
     * Gets the steaming file.
     *
     * @param response the response
     * @param fileName the file name
     * @param folderName the folder name
     * @return the steaming file
     */
    @RequestMapping(value = {"downloadFile/{folderName}/{fileName}", "downloadFile/{folderName}", "downloadFile"}, method = RequestMethod.GET)
    public ResponseEntity getSteamingFile(HttpServletResponse response,
            @PathVariable(name = "fileName", required = false) String fileName , @PathVariable(name = "folderName", required = false) String folderName, @RequestParam("token") String token) {
        // connect S3 
        try {
        	Date currenDate = new Date();
        	com.infini.ccache.api.entity.UserInfo userInfo = userService.isExistUserByToken(token);
        	if(userInfo ==null || userInfo.getToken() == null || !userInfo.getToken().equals(token) || userInfo.getTimeCreateToken() == null || currenDate.getTime() - userInfo.getTimeCreateToken().getTime() > TIME_TO_DESTROY_TOKEN) {
        		String content = getContent();
                HttpHeaders responseHeaders = new HttpHeaders();
                responseHeaders.setContentType(MediaType.TEXT_HTML);
        		return new ResponseEntity<String>(content, responseHeaders, HttpStatus.NOT_FOUND);
        	}else {
        		ResponseEntity<byte[]> download = s3.download(folderName, fileName);
                return download;
        	}
        	
            
        } catch (Exception e1) {
        	e1.printStackTrace();
            String content = getContent();
            HttpHeaders responseHeaders = new HttpHeaders();
            responseHeaders.setContentType(MediaType.TEXT_HTML);
            return new ResponseEntity<String>(content, responseHeaders, HttpStatus.NOT_FOUND);
        }
    }

    /**
     * Gets the content.
     *
     * @return the content
     */
    public String getContent() {
        String content = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\r\n" + 
                "<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n" + 
                "<head>\r\n" + 
                "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\r\n" + 
                "<title>404 - ファイルまたはディレクトリが見つかりません。</title>\r\n" + 
                "<style type=\"text/css\">\r\n" + 
                "body{margin:0;font-size:.7em;font-family:Verdana, Arial, Helvetica, sans-serif;background:#f8f8f8;}\r\n" + 
                "fieldset{padding:0 15px 10px 15px;} \r\n" + 
                "h1{font-size:2.4em;margin:0;color:#0B610B;}\r\n" + 
                "h2{font-size:1.7em;margin:0;color:#CC0000;} \r\n" + 
                "h3{font-size:1.2em;margin:10px 0 0 0;color:#000000;} \r\n" + 
                "#header{width:96%;margin:0 0 0 0;padding:6px 2% 6px 2%;font-family:\"trebuchet MS\", Verdana, sans-serif;color:#FFF;\r\n" + 
                "background-color:#f8f8f8;}\r\n" + 
                "#content{margin:0 0 0 2%;position:relative;}\r\n" + 
                ".content-container{background:#FFF;width:96%;margin-top:8px;padding:10px;position:relative;}\r\n" + 
                "</style>\r\n" + 
                "</head>\r\n" + 
                "<body>\r\n" + 
                "<div id=\"header\"><h1>INFINI Calendar Cache</h1></div>\r\n" + 
                "<div id=\"content\">\r\n" + 
                " <div class=\"content-container\"><fieldset>\r\n" + 
                "  <h2>404 - ファイルまたはディレクトリが見つかりません。</h2>\r\n" + 
                "  <h3>検索中のリソースは削除された可能性があります。または、名前が変更されたか、一時的に使用不可能になっています。</h3>\r\n" + 
                " </fieldset></div>\r\n" + 
                "</div>\r\n" + 
                "</body>\r\n" + 
                "</html>\r\n" + 
                "";
        return content;
    }

}
