package com.infini.ccache.api.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Component;

import com.infini.ccache.api.entity.FileInfo;
import com.infini.ccache.api.properties.AppProperties;
import com.infini.ccache.api.service.InformationFilesService;

// TODO: Auto-generated Javadoc
/**
 * The Class InformationFilesServiceImpl.
 */
@Component
public class InformationFilesServiceImpl implements InformationFilesService{
	
    /** The app. */
    @Autowired
    AppProperties app;

    /** The jdbc template. */
    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;

    /* (non-Javadoc)
     * @see com.infini.ccache.api.service.InformationFilesService#getInfoFiles(java.lang.String)
     */
    @Override
    public List<FileInfo> getInfoFiles (String fileCount) throws Exception{
        if (fileCount == null) {
            fileCount = "1";
        }
        List<Map<String, Object>> rows = null;
        SqlParameterSource namedParameters = null;
        List<FileInfo> listFile = new ArrayList<FileInfo>();
        String path = app.getDomain() + "downloadFile/";
        String sql ="SELECT file_path, DATE_FORMAT(created_date_time, \"%Y-%m-%d %T\") as created_datetime FROM `file_info` ORDER BY created_date_time DESC LIMIT :fileCount";
        namedParameters = new MapSqlParameterSource().addValue("fileCount", Integer.parseInt(fileCount));
        try {
            rows = jdbcTemplate.queryForList(sql, namedParameters);
            for (Map<String, Object> row : rows) {
                FileInfo info = new FileInfo();
                info.setDateTime(row.get("created_datetime").toString());
                info.setFilePath(path + row.get("file_path").toString());
                listFile.add(info);
            }
        }catch (Exception e) {
            throw e;
        }

        return listFile;
        }
    }

