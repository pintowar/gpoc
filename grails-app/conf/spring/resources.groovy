import gpoc.security.WebSecurityConfig
import org.springframework.scheduling.quartz.MethodInvokingJobDetailFactoryBean
import org.springframework.scheduling.quartz.SimpleTriggerFactoryBean
import org.springframework.scheduling.quartz.SchedulerFactoryBean
// Place your Spring DSL code here
beans = {
    xmlns context:"http://www.springframework.org/schema/context"
    context.'component-scan'('base-package': "gpoc.controller")

    simpleJobDetail(MethodInvokingJobDetailFactoryBean){
        targetObject = ref("notificationService")
        targetMethod = "scheduledNotify"
    }

    simpleTrigger(SimpleTriggerFactoryBean){
        jobDetail = ref('simpleJobDetail')
        startDelay = 1000
        repeatInterval = 2000
    }

    schedulerFactory(SchedulerFactoryBean){
        jobDetails = [ref('simpleJobDetail')]
        triggers = [ref('simpleTrigger')]
    }

    webSecurityConfiguration(WebSecurityConfig)
}
