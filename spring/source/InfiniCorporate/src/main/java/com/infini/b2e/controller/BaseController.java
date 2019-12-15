package com.infini.b2e.controller;

import org.springframework.boot.web.servlet.error.ErrorController;

import com.infini.b2e.view.BaseView;

public class BaseController implements ErrorController {

    protected BaseView view;

    public BaseController() {

    }

    @Override
    public String getErrorPath() {
        return null;
    }

    public BaseView initView() {
        return initView("");
    }

    public BaseView initView(String layout) {
        view = new BaseView(layout);
        return view;
    }

}
