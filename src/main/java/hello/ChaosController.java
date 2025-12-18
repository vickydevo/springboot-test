package com.vickydevo.hello;

import io.micrometer.core.annotation.Timed;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/chaos")
public class ChaosController {

    private static final List<byte[]> memoryLeakList = new ArrayList<>();

    // Tracks the frequency and latency of 500 errors in Prometheus
    @Timed(value = "chaos.errors", description = "Time taken to return errors")
    @GetMapping("/error")
    public String triggerError() {
        throw new RuntimeException("Government Portal Service Failure - Simulated");
    }

    // Tracks the memory leak calls
    @Timed(value = "chaos.leak", description = "Time taken to allocate memory")
    @GetMapping("/leak")
    public String triggerLeak() {
        // Allocate 20MB per request to speed up the demo
        byte[] data = new byte[20 * 1024 * 1024]; 
        memoryLeakList.add(data);
        return "Memory Leaked! Current list size: " + memoryLeakList.size();
    }
}
