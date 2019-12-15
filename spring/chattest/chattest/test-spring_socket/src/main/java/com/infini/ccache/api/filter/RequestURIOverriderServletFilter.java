package com.infini.ccache.api.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

// TODO: Auto-generated Javadoc
/**
 * The Class RequestURIOverriderServletFilter.
 */
public class RequestURIOverriderServletFilter implements Filter {
    
    /* (non-Javadoc)
     * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.getRemoteHost();
        chain.doFilter(request, response);
    }
}
