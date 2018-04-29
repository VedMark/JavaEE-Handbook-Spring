package com.javaeehandbook;

import com.javaeehandbook.model.JavaEETechnology;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.List;
import java.util.ResourceBundle;

@Service
public class DatabaseProxy {
    private ResourceBundle resources = ResourceBundle.getBundle("rest");

    public List<JavaEETechnology> getAll() {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
        final String uri = resources.getString("rest.url") + "/" +
                resources.getString("rest.javaeehandbook") + "/" +
                resources.getString("rest.javaeehandbook.get");
        return Arrays.asList(restTemplate.getForEntity(uri, JavaEETechnology[].class).getBody());
    }

    public void add(@NonNull JavaEETechnology technology) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
        restTemplate.getMessageConverters().add(new StringHttpMessageConverter());
        final String uri = resources.getString("rest.url") + "/" +
                resources.getString("rest.javaeehandbook") + "/" +
                resources.getString("rest.javaeehandbook.post");
        restTemplate.postForObject(uri, technology, JavaEETechnology.class);
    }

    public void update(@NonNull JavaEETechnology network) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
        restTemplate.getMessageConverters().add(new StringHttpMessageConverter());
        final String uri = resources.getString("rest.url") + "/" +
                resources.getString("rest.javaeehandbook") + "/" +
                resources.getString("rest.javaeehandbook.put");
        restTemplate.put(uri, network, JavaEETechnology.class);
    }

    public void delete(int id) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
        restTemplate.getMessageConverters().add(new StringHttpMessageConverter());
        final String uri = resources.getString("rest.url") + "/" +
                resources.getString("rest.javaeehandbook") + "/" +
                resources.getString("rest.javaeehandbook.delete") + "/" + id;
        restTemplate.delete(uri);
    }
}
