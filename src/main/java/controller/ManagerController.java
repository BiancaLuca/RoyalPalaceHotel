package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerController {

    @RequestMapping(value = "/manager")
    public String getManagerPage() { return "manager"; }

}
