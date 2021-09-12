package com.tiikopapas.site.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

@Service
@PropertySource({ "classpath:application.properties" })
public class PropertiesServiceImpl implements PropertiesService {

    @Value("${host.images}")
    String imagesHostUrl;

    public String getImagesHostUrl() {
        return imagesHostUrl;
    }
}
