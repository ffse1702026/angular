package com.infini.b2e.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.infini.b2e.entity.MstQuestion;
import com.infini.b2e.entity.UserAgent;
import com.infini.b2e.entity.UserSecretQuestion;
import com.infini.b2e.service.MstQuestionService;
import com.infini.b2e.service.UserAgentService;
import com.infini.b2e.service.UserSecretQuestionService;
import com.infini.b2e.utils.PaginationUtils;

@Controller
@RequestMapping(value = { "/inf_admin" })
public class UserAgentController extends BaseController {

    private final int maxResult = 20;

    private final int offset = 4;

    @Autowired
    private UserAgentService userAgentService;

    @Autowired
    private MstQuestionService mstQuestionService;

    @Autowired
    private MessageSource messageSource;

    @Autowired
    private UserSecretQuestionService userSecretQuestionService;

    /**
     * @return
     */
    @RequestMapping(value = { "/menu" }, method = RequestMethod.GET)
    public ModelAndView menu() {
        initView("layout");
        return view;
    }

    /**
     * @param agent_id
     * @param pcc
     * @param agent_name
     * @param page
     * @return
     */
    @RequestMapping(value = { "/agent" }, method = RequestMethod.GET)
    public ModelAndView listSearchUserAgent(@RequestParam(name = "agent_id", required = false) String agent_id,
            @RequestParam(name = "pcc", required = false) String pcc, @RequestParam(name = "agent_name", required = false) String agent_name,
            @RequestParam(name = "page", defaultValue = "1") int page) {
        initView("layout");
        if (page <= 0) {
            page = 1;
        }
        float totalRecord = userAgentService.countSearchUserAgent(agent_id, pcc, agent_name);
        int totalPage = (int) Math.ceil(totalRecord / maxResult);
        if (page > totalPage) {
            page = 1;
            totalRecord = userAgentService.countSearchUserAgent(agent_id, pcc, agent_name);
        }
        PaginationUtils.pagination(page, totalPage, view, offset);
        view.addObject("listUserAgent", userAgentService.getAllUserAgentByKeySearch(agent_id, pcc, agent_name, page, maxResult));
        StringBuilder param = new StringBuilder("");
        if (agent_id != null) {
            param.append("&agent_id=").append(agent_id).append("&pcc=").append(pcc).append("&agent_name=").append(agent_name);
        }
        view.addObject("paramSearch", param);
        view.addObject("view", "agent/index.html");
        view.addObject("totalRecords", (int) totalRecord);
        return view;
    }

    /**
     * @param model
     * @return
     */
    @RequestMapping(value = { "/agent/setting" }, method = RequestMethod.GET)
    public ModelAndView createUserAgent(ModelMap model) {
        initView("layout");
        UserAgent userAgent = new UserAgent();
        userAgent.setDelete_flg("0");
        view.addObject("userAgent", userAgent);
        view.addObject("action", "create");
        view.addObject("view", "agent/form.html");
        return view;
    }

    /**
     * @param redirectAttributes
     * @param model
     * @param userAgent
     * @param result
     * @return
     */
    @RequestMapping(value = { "/agent/setting" }, method = RequestMethod.POST)
    public String createUserAgent(final RedirectAttributes redirectAttributes, ModelMap model, @ModelAttribute("userAgent") @Valid UserAgent userAgent,
            BindingResult result) {
        if (userAgentService.getUserAgentByAgentId(userAgent.getAgent_id()) != null) {
            FieldError error = new FieldError("userAgent", "agent_id",
                    messageSource.getMessage("Unique.userAgent.agent_id", new String[] { userAgent.getAgent_id() }, Locale.getDefault()));
            result.addError(error);
        }
        if (userAgentService.getUserAgentByAgentEmail(userAgent.getMail_address()) != null) {
            FieldError error = new FieldError("userAgent", "mail_address",
                    messageSource.getMessage("Unique.userAgent.mail_address", new String[] { userAgent.getMail_address() }, Locale.getDefault()));
            result.addError(error);
        }
        if (result.hasErrors()) {
            model.addAttribute("action", "create");
            model.addAttribute("view", "agent/form.html");
            model.addAttribute("listError", result.getAllErrors());
            model.addAttribute("messageError", "Can't not create User Agent.");
            return "layout";
        }
        userAgentService.createUserAgent(userAgent);
        redirectAttributes.addFlashAttribute("message", "Added successfully.");
        return "redirect:/inf_admin/agent/";
    }

    /**
     * @param model
     * @param agent_id
     * @return
     */
    @RequestMapping(value = { "/agent/setting/{agent_id}" }, method = RequestMethod.GET)
    public ModelAndView editUserAgent(ModelMap model, @PathVariable("agent_id") String agent_id) {
        initView("layout");
        view.addObject("userAgent", userAgentService.getUserAgentByAgentId(agent_id));
        view.addObject("action", "update");
        view.addObject("view", "agent/form.html");
        return view;
    }

    /**
     * @param redirectAttributes
     * @param model
     * @param userAgent
     * @param result
     * @return
     */
    @RequestMapping(value = { "/agent/update" }, method = RequestMethod.POST)
    public String updateUserAgent(final RedirectAttributes redirectAttributes, ModelMap model, @ModelAttribute("userAgent") @Valid UserAgent userAgent,
            BindingResult result) {
        if (userAgentService.getUserAgentByAgentEmail(userAgent.getMail_address()) != null) {
            UserAgent userAgentCompare = userAgentService.getUserAgentByAgentEmail(userAgent.getMail_address());
            if (!userAgent.getAgent_id().equals(userAgentCompare.getAgent_id())) {
                FieldError error = new FieldError("userAgent", "mail_address",
                        messageSource.getMessage("Unique.userAgent.mail_address", new String[] { userAgent.getMail_address() }, Locale.getDefault()));
                result.addError(error);
            }
        }
        if (result.hasErrors()) {
            model.addAttribute("action", "update");
            model.addAttribute("view", "agent/form.html");
            model.addAttribute("listError", result.getAllErrors());
            model.addAttribute("messageError", "Can't not update User Agent.");
            return "layout";
        }
        userAgentService.updateUserAgent(userAgent);
        redirectAttributes.addFlashAttribute("message", "Update User Agent successfully.");
        return "redirect:/inf_admin/agent/";
    }

    /**
     * @param redirectAttributes
     * @param model
     * @param agent_id
     * @return
     */
    @RequestMapping(value = { "/agent/delete/{agent_id}" }, method = RequestMethod.GET)
    public String deleteUserAgent(final RedirectAttributes redirectAttributes, ModelMap model, @PathVariable("agent_id") String agent_id) {
        userAgentService.deleteUserAgent(userAgentService.getUserAgentByAgentId(agent_id));
        redirectAttributes.addFlashAttribute("message", "Delete User Agent successfully.");
        return "redirect:/inf_admin/agent/";
    }

    /**
     * @param redirectAttributes
     * @param model
     * @param agent_id
     * @return
     */
    @RequestMapping(value = { "/agent/resetpassword/{agent_id}" }, method = RequestMethod.GET)
    public String resetUserAgentPassword(final RedirectAttributes redirectAttributes, ModelMap model, @PathVariable("agent_id") String agent_id, Principal principal) {
        initView("layout");
        /*
         * if(!principal.getName().equals(agent_id)) { return "redirect:/logout"; }
         */
        UserSecretQuestion userSecretQuestion = userSecretQuestionService.getUserSecretQuestion(agent_id, null);
        List<MstQuestion> listMstQuestion = mstQuestionService.getAllMstQuestion();
        if (userSecretQuestion == null) {
            userSecretQuestion= new UserSecretQuestion();
            userSecretQuestion.setAgent_id(agent_id);
            model.addAttribute("listMstQuestion", listMstQuestion);
            model.addAttribute("userSecretQuestion", userSecretQuestion);
            model.addAttribute("view", "resetpassword/formreset.html");
        } else {
            view.addObject("userSecretQuestion", userSecretQuestion);
            view.addObject("view", "resetpassword/formresetonlypass.html");
        }
        return "layout";
    }

    @RequestMapping(value = { "/agent/resetPassword" }, method = RequestMethod.POST)
    public String resetUserAgentPassword(HttpServletRequest request, @ModelAttribute("userSecretQuestion") @Valid UserSecretQuestion userSecretQuestion,
            ModelMap model, BindingResult result) {
        String password = (String) request.getParameter("password");
        String rePassword = (String) request.getParameter("repassword");
        String regex = "^(?=.*[0-9])(?=.*[a-z]).{7,}$";
        String agentId = (String) request.getParameter("agent_id");
        List<String> listError = new ArrayList<String>();
        if (!password.equals(rePassword)) {
            listError.add("retype password not true!!!");
        }
        if (!password.matches(regex)) {
            listError.add("Password at least 7 character contain character and number!!!");
        }
        if (result.hasErrors() || listError.size() > 0) {
            model.addAttribute("action", "update");
            if (userSecretQuestion != null) {
                model.addAttribute("view", "resetpassword/formreset.html");
            } else {
                model.addAttribute("view", "resetpassword/formresetonlypass.html");
            }
            model.addAttribute("listError", result.getAllErrors());
            model.addAttribute("listErrorPass", listError);
            model.addAttribute("messageError", "Can't not update User Agent.");
            return "layout";
        }
        if (userSecretQuestion != null) {
            userSecretQuestionService.saveUserSecretQuestion(userSecretQuestion);
        }
        UserAgent userAgent = userAgentService.getUserAgentByAgentId(agentId);
        userAgent.setPassword(password);
        userAgentService.updateUserAgent(userAgent);
        return "redirect:/inf_admin/agent";
    }
    
    @RequestMapping(value = { "/agent/reset" }, method = RequestMethod.POST)
    public String resetUserAgentPassword(HttpServletRequest request,
            ModelMap model) {
        String password = (String) request.getParameter("password");
        String rePassword = (String) request.getParameter("repassword");
        String regex = "^(?=.*[0-9])(?=.*[a-z]).{7,}$";
        String agentId = (String) request.getParameter("agent_id");
        List<String> listError = new ArrayList<String>();
        if (!password.equals(rePassword)) {
            listError.add("retype password not true!!!");
        }
        if (!password.matches(regex)) {
            listError.add("Password at least 7 character contain character and number!!!");
        }
        if (listError.size() > 0) {
            model.addAttribute("view", "resetpassword/formresetonlypass.html");
            model.addAttribute("listError", listError);
            model.addAttribute("messageError", "Can't not update");
            return "layout";
        }
        UserAgent userAgent = userAgentService.getUserAgentByAgentId(agentId);
        userAgent.setPassword(password);
        userAgentService.updateUserAgent(userAgent);
        return "redirect:/inf_admin/agent";
    }

}
