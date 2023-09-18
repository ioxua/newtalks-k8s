package br.com.ioxua.newtalks.k8s.demo

import org.springframework.boot.WebApplicationType
import org.springframework.boot.SpringApplication
import org.springframework.boot.builder.SpringApplicationBuilder
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam

@RestController
class DemoController {
    @GetMapping("/")
    fun index(@RequestParam("name") name: String) = "Hello, $name!"

    @GetMapping("/shutdown")
    fun shutdown() {
        val ctx = SpringApplicationBuilder(DemoApplication::class.java).web(WebApplicationType.NONE).run()
        SpringApplication.exit(ctx, {
            0
        })
    }
}