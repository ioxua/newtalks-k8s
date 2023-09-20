package br.com.ioxua.newtalks.k8s.demo

import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam

@RestController
@RequestMapping(produces = [MediaType.APPLICATION_JSON_VALUE])
class DemoController {
    @GetMapping("/")
    fun index(@RequestParam(value = "name", required = false) name: String?): Map<String, String> {
        val value = name ?: "world"
        return mapOf("message" to "Hello, $name!")
    }

    @GetMapping("/env")
    fun env(): Map<String, String> {
        return mapOf(
            "mySecret" to System.getenv("MY_SECRET"),
            "apiUrl" to System.getenv("API_URL"),
        )
    }
}