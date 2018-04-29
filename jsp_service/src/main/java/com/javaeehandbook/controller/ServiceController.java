package com.javaeehandbook.controller;

import com.javaeehandbook.DatabaseProxy;
import com.javaeehandbook.model.JavaEETechnology;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("javaeehandbook")
@EntityScan(basePackages = {"com.javaeehandbook.model"})
public class ServiceController {

    public ServiceController() {
    }

    private DatabaseProxy database;

    @Autowired
    public ServiceController(DatabaseProxy controller) {
        this.database = controller;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView startPageGet() {
        return new ModelAndView("index");
    }

    @RequestMapping(value = "technologies", method = RequestMethod.GET)
    public ModelAndView getTechnologies() {
//        List<JavaEETechnology> technologies = database.getAll();
        return new ModelAndView("view_technologies", "technologies", new ArrayList<JavaEETechnology>());
    }

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public ModelAndView addTechnologyGet() {
        return new ModelAndView("add_technology", "technology", new JavaEETechnology());
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public ModelAndView addTechnologyPOST(@ModelAttribute("technology") JavaEETechnology technology) {
        database.add(technology);
        return new ModelAndView("view_technologies");
    }

    @RequestMapping(value = "update", method = RequestMethod.GET)
    public ModelAndView updateTechnologyGet(@ModelAttribute("technology") JavaEETechnology technology) {
        return new ModelAndView("edit_technology", "technology", technology);
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public ModelAndView updateTechnologyPost(@ModelAttribute("technology") JavaEETechnology technology) {
        database.update(technology);
        return new ModelAndView("view_technologies");
    }

    @RequestMapping(value = "remove", method = RequestMethod.GET)
    public ModelAndView deleteTechnologyGet(@ModelAttribute("id") Integer id) {
        database.delete(id);
        return new ModelAndView("view_technologies");
    }
}
