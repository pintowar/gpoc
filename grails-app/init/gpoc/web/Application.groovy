package gpoc.web

import grails.boot.GrailsApp
import grails.boot.config.GrailsAutoConfiguration
import org.apache.camel.RoutesBuilder
import org.apache.camel.builder.RouteBuilder
import org.springframework.context.annotation.Bean

class Application extends GrailsAutoConfiguration {

    @Bean
    RoutesBuilder notifier() {
        return new RouteBuilder() {
            @Override
            public void configure() throws Exception {
                //from("timer:foo?period=2s")
                from("file:///${System.properties['user.home']}/camelDir/in")
                .transform { (Math.random() > 0.5 ? "alpha" : "omega") }
                .to("bean://notificationService?method=notify")
            }
        };
    }

    static void main(String[] args) {
        GrailsApp.run(Application)
    }
}
