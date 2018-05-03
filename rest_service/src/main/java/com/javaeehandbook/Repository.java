package com.javaeehandbook;

import com.javaeehandbook.model.JavaEETechnology;
import org.springframework.data.repository.CrudRepository;

@org.springframework.stereotype.Repository
interface Repository extends CrudRepository<JavaEETechnology, Integer> {
}
