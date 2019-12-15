package com.infini.ccache.api.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.ws.config.annotation.EnableWs;
import org.springframework.ws.config.annotation.WsConfigurerAdapter;
import org.springframework.ws.server.EndpointInterceptor;
import org.springframework.ws.soap.server.endpoint.interceptor.PayloadRootSmartSoapEndpointInterceptor;
import org.springframework.ws.transport.http.MessageDispatcherServlet;
import org.springframework.ws.wsdl.wsdl11.DefaultWsdl11Definition;
import org.springframework.xml.xsd.SimpleXsdSchema;
import org.springframework.xml.xsd.XsdSchema;

import com.infini.ccache.api.common.constant.ConstMisc;
import com.infini.ccache.api.interceptor.CustomEndpointInterceptor;
import com.infini.ccache.api.properties.AppProperties;

/**
 * The Class SoapConfig.
 */
@EnableWs
@Configuration
public class SoapConfig extends WsConfigurerAdapter {
    
    /** The app. */
    @Autowired
    AppProperties app;

    /**
     * Surcharge schema.
     *
     * @return the xsd schema
     */
    @Bean
    public XsdSchema surchargeSchema() {
        return new SimpleXsdSchema(new ClassPathResource("api.xsd"));
    }

    /**
     * Default wsdl 11 definition.
     *
     * @param surchargeSchema the surcharge schema
     * @return the default wsdl 11 definition
     */
    @Bean(name = "apiDownloadFile")
    public DefaultWsdl11Definition defaultWsdl11Definition(XsdSchema surchargeSchema) {
        DefaultWsdl11Definition definition = new DefaultWsdl11Definition();
        definition.setPortTypeName("apiDownloadFilePort");
        definition.setTargetNamespace(app.getDomainApi());
        definition.setLocationUri("/ws");
        definition.setSchema(surchargeSchema);
        return definition;
    }

    /**
     * Message dispatcher servlet.
     *
     * @param context the context
     * @return the servlet registration bean
     */
    @Bean
    public ServletRegistrationBean messageDispatcherServlet(ApplicationContext context) {
        MessageDispatcherServlet messageDispatcherServlet = new MessageDispatcherServlet();
        messageDispatcherServlet.setApplicationContext(context);
        messageDispatcherServlet.setTransformWsdlLocations(true);
        return new ServletRegistrationBean(messageDispatcherServlet, "/ws/*");
    }

    /* (non-Javadoc)
     * @see org.springframework.ws.config.annotation.WsConfigurerAdapter#addInterceptors(java.util.List)
     */
    @Override
    public void addInterceptors(List<EndpointInterceptor> interceptors) {

        // register global interceptor
        interceptors.add(new CustomEndpointInterceptor());

        // register endpoint specific interceptor
        interceptors.add(new PayloadRootSmartSoapEndpointInterceptor(
                new CustomEndpointInterceptor(),
                app.getDomainApi(),
                ConstMisc.BEER_REQUEST_LOCAL_PART));
    }
}