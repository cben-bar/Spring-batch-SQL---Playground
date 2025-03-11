package com.example.horoquartz;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.batch.core.configuration.annotation.EnableBatchProcessing;

@SpringBootApplication
@EnableBatchProcessing
public class HoroquartzBatchApplication {
    public static void main(String[] args) {
        SpringApplication.run(HoroquartzBatchApplication.class, args);
    }
} 