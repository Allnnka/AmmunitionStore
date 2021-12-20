package com.allnnka.controllers;

import com.allnnka.model.Ammunition;
import com.allnnka.service.AmmunitionService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
public class AmmunitionController {

    final AmmunitionService ammunitionService;

    public AmmunitionController(AmmunitionService ammunitionService) {
        this.ammunitionService = ammunitionService;
    }

    @GetMapping("/")
    public String index(HttpServletRequest request) {
        List<Ammunition> ammunitionList = ammunitionService.getAll();
        request.setAttribute("ammunitionform",new Ammunition());
        request.setAttribute("ammunitionList", ammunitionList);
        return "index";
    }
    @PostMapping(value = "/")
    public String submit(@Valid @ModelAttribute("ammunitionform") Ammunition ammunition, BindingResult errors, HttpServletRequest request) {
        if(errors.hasErrors()){
            List<Ammunition> ammunitionList = ammunitionService.getAll();
            request.setAttribute("ammunitionList", ammunitionList);
            return "index";
        }
        if(request.getParameter("add")!=null){
            ammunitionService.addAmmunition(ammunition);
        }
        if(request.getParameter("delete")!=null){
            ammunitionService.deleteAmmunition(ammunition);
        }
        return "redirect:/";
    }
}
