package gpoc.controller

import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

import java.util.concurrent.atomic.AtomicLong

/**
 * Created by thiago on 27/04/15.
 */
@RestController
@RequestMapping("/classic")
class ClassicController {
    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();

    @RequestMapping("/greeting")
    public Map greeting(@RequestParam(value="name", defaultValue="World") String name) {
        return [counter: counter.incrementAndGet(), msg: String.format(template, name)]
    }
}
