package com.javaeehandbook;

import com.javaeehandbook.model.JavaEETechnology;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("javaeehandbook")
@EntityScan(basePackages = {"com.javaeehandbook.model"})
public class Controller {

    private Repository repository;

    public Controller() {

    }

    @Autowired
    public Controller(Repository repository) {
        this.repository = repository;
    }

    @RequestMapping(value = "technologies", method = RequestMethod.GET)
    public ResponseEntity<JavaEETechnology[]> getJavaEETechnologys() {
        JavaEETechnology[] javaEETechnologies;
        try {
            Iterable<JavaEETechnology> iterator = repository.findAll();
            javaEETechnologies = getJavaEETechnologiesArray(iterator);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(javaEETechnologies, HttpStatus.OK);
    }

    @RequestMapping(value = "technologies/{id}", method = RequestMethod.GET)
    public ResponseEntity<JavaEETechnology> getJavaEETechnologyById(@RequestParam Integer id) {
        JavaEETechnology[] javaEETechnologies;
        try {
            Iterable<JavaEETechnology> iterator = repository.findAll();
            javaEETechnologies = getJavaEETechnologiesArray(iterator);
            if(javaEETechnologies.length == 0) {
                throw new Exception("Could not find technology entry");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(javaEETechnologies[0], HttpStatus.OK);
    }

    private JavaEETechnology[] getJavaEETechnologiesArray(Iterable<JavaEETechnology> iterator) {
        JavaEETechnology[] javaEETechnologies;List<JavaEETechnology> technologies = new ArrayList<>();
        iterator.forEach(technologies::add);
        javaEETechnologies = technologies.toArray(new JavaEETechnology[0]);
        return javaEETechnologies;
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public ResponseEntity<Void> addJavaEETechnology(@RequestBody JavaEETechnology technology) {
        try{
            repository.save(technology);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping(value = "update", method = RequestMethod.PUT)
    public ResponseEntity<Void> changeJavaEETechnology(@RequestBody JavaEETechnology technology) {
        ResponseEntity<Void> response = null;
        try{
//            Optional<JavaEETechnology> byId = repository.findById(technology.getId());
//            if (byId.isPresent()) {
//                JavaEETechnology old = byId.get();
//                repository.delete(old);
//                repository.save(technology);
//                response = new ResponseEntity<>(HttpStatus.OK);
//            } else {
//                response =  new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//            }
        } catch (Exception e) {
            e.printStackTrace();
            response = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return response;
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> removeJavaEETechnology(@RequestParam Integer id) {
        try {
//            repository.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
