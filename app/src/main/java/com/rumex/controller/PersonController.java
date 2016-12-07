package com.rumex.controller;

import com.rumex.model.Person;
import com.rumex.service.PersonService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
public class PersonController {

    private static final Logger logger = LoggerFactory.getLogger(PersonController.class);

    @Autowired
    private PersonService personService;

    @RequestMapping(value = "/personProfile", method = RequestMethod.GET)
    public ModelAndView loadFileUploadPage(Map<String, Object> model) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("personProfile");

        Person person = new Person();
        person.setFirstName("smf,ns,dmfn");

        logger.info("aaaaaaaaaaaaaaaa");

        return new ModelAndView("personProfile", "command", person);
    }

    @RequestMapping(value = "/addPerson", method = RequestMethod.POST)
    public String addStudent(@ModelAttribute("command")Person student,
                             ModelMap model) {
        model.addAttribute("id", student.getId());
        model.addAttribute("firstName", student.getFirstName());
        model.addAttribute("lastName", student.getLastName());
        model.addAttribute("address", student.getAddress());
        model.addAttribute("dateOfBirth", student.getDateOfBirth());

        Person person = new Person();

        //person.setId(student.getId());
        person.setFirstName(student.getFirstName());
        person.setLastName(student.getLastName());
        person.setAddress(student.getAddress());
        person.setDateOfBirth(student.getDateOfBirth());

        personService.savePerson(person);


        return "personDetails";
    }


    @RequestMapping(value = "/allPersonsDetails", method = RequestMethod.GET)
    public ModelAndView getAllPersonsDetails(Map<String, Object> model) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("allPersonsDetails");

        List<Person> persons = personService.getAllPersons();

        logger.info(persons.toString());

        return new ModelAndView("allPersonsDetails", "persons", persons);

       // return modelAndView;
    }



    @RequestMapping(value="/deletePerson/{id}", method=RequestMethod.GET)
    public ModelAndView deleteContact(@PathVariable("id")
                                        Integer articleId) {

//        articleService.removeArticle(articleId);

        logger.info("deleteing");

        personService.deletePerson(articleId.longValue());

        return new ModelAndView("personProfile", "command", new Person());
    }



    @RequestMapping(value="/updatePerson/{id}", method=RequestMethod.GET)
    public ModelAndView updatePerson(@PathVariable("id")
                                              Integer id) {

//        articleService.removeArticle(articleId);

        logger.info("updating");

        Person person = personService.getPerson( id.longValue());

        return new ModelAndView("personEdit", "command", person);
    }

    @RequestMapping(value = "/saveUpdatesToDB", method = RequestMethod.POST)
    public String saveUpdatesToDB(@ModelAttribute("command")Person student,
                             ModelMap model) {
        model.addAttribute("id", student.getId());
        model.addAttribute("firstName", student.getFirstName());
        model.addAttribute("lastName", student.getLastName());
        model.addAttribute("address", student.getAddress());
        model.addAttribute("dateOfBirth", student.getDateOfBirth());



        logger.info("saving To DB");
        logger.info(student.getAddress());
        logger.info(student.getDateOfBirth().toString());

        Person person = new Person();

        //person.setId(student.getId());
        person.setFirstName(student.getFirstName());
        person.setLastName(student.getLastName());
        person.setAddress(student.getAddress());
        person.setDateOfBirth(student.getDateOfBirth());

        personService.updatePerson(person);

        logger.info("saving To DB");

        return "personDetails";
    }
}