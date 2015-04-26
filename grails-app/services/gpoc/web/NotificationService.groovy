package gpoc.web

import grails.transaction.Transactional
import org.springframework.messaging.simp.SimpMessagingTemplate

//@Transactional
class NotificationService {

    SimpMessagingTemplate brokerMessagingTemplate

    def notify(String message) {
        brokerMessagingTemplate.convertAndSend "/topic/hello", message
    }
}
