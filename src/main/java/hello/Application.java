package hello;

import java.util.Arrays;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import io.micrometer.core.aop.TimedAspect;
import io.micrometer.core.instrument.MeterRegistry;

/**
 * Main Application class.
 * scanBasePackages ensures Spring finds both HelloController (hello) 
 * and ChaosController (com.vickydevo.hello).
 */
@SpringBootApplication(scanBasePackages = {"hello", "com.vickydevo.hello"})
public class Application {

    public static void main(String[] args) {
        ApplicationContext ctx = SpringApplication.run(Application.class, args);
        
        // Useful for your offline session to show developers what Beans were loaded
        System.out.println("Let's inspect the beans provided by Spring Boot:");
        
        String[] beanNames = ctx.getBeanDefinitionNames();
        Arrays.sort(beanNames);
        for (String beanName : beanNames) {
            System.out.println(beanName);
        }
    }

    /**
     * Enables the @Timed annotation support for Prometheus metrics.
     * Without this Bean, the @Timed annotations in your Controllers won't report data.
     */
    @Bean
    public TimedAspect timedAspect(MeterRegistry registry) {
        return new TimedAspect(registry);
    }
}
