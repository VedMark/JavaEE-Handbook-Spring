package com.javaeehandbook;

import com.javaeehandbook.model.JavaEETechnology;
import org.springframework.http.*;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.*;

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

    public JavaEETechnology getById(Integer id) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
        final String uri = resources.getString("rest.url") + "/" +
                resources.getString("rest.javaeehandbook") + "/" +
                resources.getString("rest.javaeehandbook.get") + "/{id}";

        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(uri)
                .queryParam("id", id);
        final HttpHeaders headers = new HttpHeaders();
        headers.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        HttpEntity<?> entity = new HttpEntity<>(headers);
        HttpEntity<JavaEETechnology> response = restTemplate.exchange(
                builder.toUriString(),
                HttpMethod.GET,
                entity,
                JavaEETechnology.class);
        return response.getBody();
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
                resources.getString("rest.javaeehandbook.delete") + "/{id}";
        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(uri)
                .queryParam("id", id);
        HttpEntity<?> entity = new HttpEntity<>(new HttpHeaders());
        restTemplate.exchange(builder.toUriString(), HttpMethod.DELETE, entity, JavaEETechnology.class);
    }
}
