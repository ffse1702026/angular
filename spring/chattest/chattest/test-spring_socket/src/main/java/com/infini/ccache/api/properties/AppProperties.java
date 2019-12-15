package com.infini.ccache.api.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

// TODO: Auto-generated Javadoc
/**
 * The Class AppProperties.
 */
@Component
@ConfigurationProperties("app")
public class AppProperties {

    /** The domain. */
    private String domain;
    
    /** The domain api. */
    private String domainApi;
    
    /** The file xsd. */
    private String fileXsd;
    
    /** The zip file information file count. */
    private String zipFileInformationFileCount;
    
    /** The path. */
    private String path;

    /**
     * Gets the domain.
     *
     * @return the domain
     */
    public String getDomain() {
        return domain;
    }

    /**
     * Gets the path.
     *
     * @return the path
     */
    public String getPath() {
		return path;
	}

	/**
	 * Sets the path.
	 *
	 * @param path the new path
	 */
	public void setPath(String path) {
		this.path = path;
	}

	/**
	 * Sets the domain.
	 *
	 * @param domain            the domain to set
	 */
    public void setDomain(String domain) {
        this.domain = domain;
    }

    /**
     * Gets the domain api.
     *
     * @return the domainApi
     */
    public String getDomainApi() {
        return domainApi;
    }

    /**
     * Sets the domain api.
     *
     * @param domainApi            the domainApi to set
     */
    public void setDomainApi(String domainApi) {
        this.domainApi = domainApi;
    }

    /**
     * Gets the file xsd.
     *
     * @return the fileXsd
     */
    public String getFileXsd() {
        return fileXsd;
    }

    /**
     * Sets the file xsd.
     *
     * @param fileXsd the fileXsd to set
     */
    public void setFileXsd(String fileXsd) {
        this.fileXsd = fileXsd;
    }

    /**
     * Gets the zip file information file count.
     *
     * @return the zipFileInformationFileCount
     */
    public String getZipFileInformationFileCount() {
        return zipFileInformationFileCount;
    }

    /**
     * Sets the zip file information file count.
     *
     * @param zipFileInformationFileCount the zipFileInformationFileCount to set
     */
    public void setZipFileInformationFileCount(String zipFileInformationFileCount) {
        this.zipFileInformationFileCount = zipFileInformationFileCount;
    }

}
