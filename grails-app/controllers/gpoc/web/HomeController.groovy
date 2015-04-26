package gpoc.web

import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.SendTo
import org.springframework.security.access.prepost.PreAuthorize

class HomeController {

    @PreAuthorize("hasRole('ROLE_USER')")
    def index() { }

    @PreAuthorize("hasRole('ROLE_USER')")
    @MessageMapping("/hello")
    @SendTo("/topic/hello")
    protected String hello(String world) {
        return "hello from controller, ${world}!"
    }
}
