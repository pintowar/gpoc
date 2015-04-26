package gpoc.web

import grails.boot.GrailsApp
import grails.boot.config.GrailsAutoConfiguration
import org.apache.camel.RoutesBuilder
import org.apache.camel.builder.RouteBuilder
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.ComponentScan

@ComponentScan
class Application extends GrailsAutoConfiguration {

    @Bean
    RoutesBuilder notifier() {
        return new RouteBuilder() {
            @Override
            public void configure() throws Exception {
                from("timer:foo?period=2s")
                .transform { (Math.random() > 0.5 ? "alpha" : "omega") }
                .to("bean://notificationService?method=notify")
            }
        };
    }

    static void main(String[] args) {
        GrailsApp.run(Application)
    }
}
