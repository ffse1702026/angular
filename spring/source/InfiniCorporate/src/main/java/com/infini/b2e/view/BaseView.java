package com.infini.b2e.view;

import org.springframework.web.servlet.ModelAndView;

/**
 * BaseView
 * 
 * @author nguyenhuutho
 *
 */
public class BaseView extends ModelAndView {

    /**
     * BaseView
     * 
     * @param viewName
     */
    public BaseView(String viewName) {
        super(viewName);
        render();
    }

    /**
     * render
     * 
     * @return
     */
    public String render() {
        return "";
    }
}