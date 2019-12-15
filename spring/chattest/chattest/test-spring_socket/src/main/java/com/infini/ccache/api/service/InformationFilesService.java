package com.infini.ccache.api.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.infini.ccache.api.entity.FileInfo;

// TODO: Auto-generated Javadoc
/**
 * The Interface InformationFilesService.
 */
@Service
public interface InformationFilesService {

    /**
     * Gets the info files.
     *
     * @param fileCount the file count
     * @return the info files
     * @throws Exception the exception
     */
    List<FileInfo> getInfoFiles (String fileCount) throws Exception;
}
