package gpoc.web

import grails.transaction.Transactional
import org.springframework.messaging.simp.SimpMessagingTemplate

//@Transactional
class NotificationService {

    SimpMessagingTemplate brokerMessagingTemplate

    def notify(Map message) {
        brokerMessagingTemplate.convertAndSendToUser message.to, "/queue/hello", message.body
    }

    def scheduledNotify() {
        brokerMessagingTemplate.convertAndSend "/topic/hello", "Enviado pelo Quartz"
    }
}
