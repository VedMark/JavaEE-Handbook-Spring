package com.javaeehandbook;

import com.javaeehandbook.model.JavaEETechnology;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("com.javaeehandbook")
@EntityScan(basePackages = {"com.com.javaeehandbook.model"})
public class Controller {

    private final Repository repository;

    @Autowired
    public Controller(Repository repository) {
        this.repository = repository;
    }

    @RequestMapping(value = "technologies", method = RequestMethod.GET)
    public ResponseEntity<JavaEETechnology[]> getJavaEETechnologys() {
        System.out.println("hello");
        Iterable<JavaEETechnology> networksIterator = repository.findAll();
        List<JavaEETechnology> networks = new ArrayList<>();
        networksIterator.forEach(networks::add);
        return new ResponseEntity<>(networks.toArray(new JavaEETechnology[0]), HttpStatus.OK);
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public ResponseEntity<Void> addJavaEETechnology(@RequestBody JavaEETechnology technology) {
        repository.save(technology);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping(value = "update", method = RequestMethod.PUT)
    public ResponseEntity<Void> changeJavaEETechnology(@RequestBody JavaEETechnology technology) {
        repository.save(technology);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> removeJavaEETechnology(@PathVariable("id") Integer id) {
        repository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
