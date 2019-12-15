package com.infini.ccache.api.interceptor;

import javax.xml.soap.SOAPMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;
import org.springframework.ws.context.MessageContext;
import org.springframework.ws.server.EndpointInterceptor;

// TODO: Auto-generated Javadoc
/**
 * The Class CustomEndpointInterceptor.
 */
@Component
public class CustomEndpointInterceptor implements EndpointInterceptor {

    /** The Constant LOG. */
    private static final Log LOG = LogFactory.getLog(CustomEndpointInterceptor.class);

    /* (non-Javadoc)
     * @see org.springframework.ws.server.EndpointInterceptor#handleRequest(org.springframework.ws.context.MessageContext, java.lang.Object)
     */
    @Override
    public boolean handleRequest(MessageContext messageContext, Object endpoint) throws Exception {
        LOG.info("Endpoint Request Handling");
        return true;
    }

    /* (non-Javadoc)
     * @see org.springframework.ws.server.EndpointInterceptor#handleResponse(org.springframework.ws.context.MessageContext, java.lang.Object)
     */
    @Override
    public boolean handleResponse(MessageContext messageContext, Object endpoint) throws Exception {
        messageContext.setProperty(SOAPMessage.CHARACTER_SET_ENCODING, "UTF-8");
        messageContext.setProperty(SOAPMessage.WRITE_XML_DECLARATION, "true");
    	LOG.info("Endpoint Response Handling");
    	// write log access to table log_access
        return true;
    }

    /* (non-Javadoc)
     * @see org.springframework.ws.server.EndpointInterceptor#handleFault(org.springframework.ws.context.MessageContext, java.lang.Object)
     */
    @Override
    public boolean handleFault(MessageContext messageContext, Object endpoint) throws Exception {
        LOG.info("Endpoint Exception Handling");
        return true;
    }

    /* (non-Javadoc)
     * @see org.springframework.ws.server.EndpointInterceptor#afterCompletion(org.springframework.ws.context.MessageContext, java.lang.Object, java.lang.Exception)
     */
    @Override
    public void afterCompletion(MessageContext messageContext, Object endpoint, Exception ex) throws Exception {
        LOG.info("Execute code after completion");
    }
}