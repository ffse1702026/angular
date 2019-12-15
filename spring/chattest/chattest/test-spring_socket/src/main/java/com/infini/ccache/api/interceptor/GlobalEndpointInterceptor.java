package com.infini.ccache.api.interceptor;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;
import org.springframework.ws.context.MessageContext;
import org.springframework.ws.server.EndpointInterceptor;

// TODO: Auto-generated Javadoc
/**
 * The Class GlobalEndpointInterceptor.
 */
@Component
public class GlobalEndpointInterceptor implements EndpointInterceptor {

    /** The Constant LOG. */
    private static final Log LOG = LogFactory.getLog(GlobalEndpointInterceptor.class);

    /* (non-Javadoc)
     * @see org.springframework.ws.server.EndpointInterceptor#handleRequest(org.springframework.ws.context.MessageContext, java.lang.Object)
     */
    @Override
    public boolean handleRequest(MessageContext messageContext, Object endpoint) throws Exception {
        LOG.info("Global Request Handling");
        return true;
    }

    /* (non-Javadoc)
     * @see org.springframework.ws.server.EndpointInterceptor#handleResponse(org.springframework.ws.context.MessageContext, java.lang.Object)
     */
    @Override
    public boolean handleResponse(MessageContext messageContext, Object endpoint) throws Exception {
        LOG.info("Global Response Handling");
        return true;
    }

    /* (non-Javadoc)
     * @see org.springframework.ws.server.EndpointInterceptor#handleFault(org.springframework.ws.context.MessageContext, java.lang.Object)
     */
    @Override
    public boolean handleFault(MessageContext messageContext, Object endpoint) throws Exception {
        LOG.info("Global Exception Handling");
        return true;
    }

    /* (non-Javadoc)
     * @see org.springframework.ws.server.EndpointInterceptor#afterCompletion(org.springframework.ws.context.MessageContext, java.lang.Object, java.lang.Exception)
     */
    @Override
    public void afterCompletion(MessageContext messageContext, Object endpoint, Exception ex) throws Exception {
        LOG.info("Execute Code After Completion");
    }
}