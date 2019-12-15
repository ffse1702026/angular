package com.infini.b2e.utils;

import java.util.ArrayList;
import java.util.List;

import com.infini.b2e.view.BaseView;

public class PaginationUtils {

    public static void pagination(int page, int totalPage, BaseView view, int offset) {
        view.addObject("totalPage", totalPage);
        List<Integer> listPage = new ArrayList<>();
        if (page > totalPage) {
            page = totalPage;
        }
        if (page == 1) {
            view.addObject("disableFirstPage", true);
        } else if (page == totalPage) {
            view.addObject("disableLastPage", true);
        }
        if (totalPage <= 1) {
            view.addObject("enablePagination", false);
        } else {
            view.addObject("enablePagination", true);
            for (int i = page - 1; i <= totalPage; i++) {
                if (totalPage >= offset && page <= 2) {
                    listPage.add(1);
                    listPage.add(2);
                    listPage.add(3);
                    listPage.add(4);
                    break;
                }
                if (totalPage >= offset && page >= totalPage - 1) {
                    listPage.add(totalPage - 3);
                    listPage.add(totalPage - 2);
                    listPage.add(totalPage - 1);
                    listPage.add(totalPage);
                    break;
                }
                if (i != 0) {
                    listPage.add(i);
                }
                if (i > page + 1) {
                    break;
                }
            }
        }
        view.addObject("page", page);
        view.addObject("listPage", listPage);
    }

}
