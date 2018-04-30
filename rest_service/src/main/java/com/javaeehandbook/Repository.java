package com.javaeehandbook;

import com.javaeehandbook.model.JavaEETechnology;
import org.springframework.data.repository.CrudRepository;


interface Repository extends CrudRepository<JavaEETechnology, Integer> {
}
