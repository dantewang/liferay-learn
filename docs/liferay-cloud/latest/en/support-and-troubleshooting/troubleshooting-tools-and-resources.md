---
toc:
  - ./troubleshooting-tools-and-resources/reading-liferay-cloud-service-logs.md
  - ./troubleshooting-tools-and-resources/shell-access.md
  - ./troubleshooting-tools-and-resources/troubleshooting-services.md
  - ./troubleshooting-tools-and-resources/disaster-recovery-overview.md
  - ./troubleshooting-tools-and-resources/configuring-cross-region-disaster-recovery.md
  - ./troubleshooting-tools-and-resources/self-healing.md
  - ./troubleshooting-tools-and-resources/liferay-cloud-platform-status.md
  - ./troubleshooting-tools-and-resources/creating-thread-and-heap-dumps.md
  - ./troubleshooting-tools-and-resources/enabling-glowroot-on-paas.md
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Liferay PaaS
uuid: 5f119685-91e2-497e-8164-f0d184b7a31e
---
# Troubleshooting Tools and Resources

When you have an issue with your site, you need tools to diagnose and resolve technical issues quickly. Liferay Cloud provides you with tools and resources for troubleshooting problems:

- [Application Metrics](#application-metrics)
- [Real-Time Alerts](#real-time-alerts)
- [Environment Activities](#environment-activities)
- [Environment Logs](#environment-logs)
- [Shell Access](#shell-access)
- [Self-Healing](#self-healing)
- [Disaster Recovery](#disaster-recovery)
- [Liferay Cloud Platform Status](#liferay-cloud-platform-status)
- [Support Access](#support-access)
- [Help Center](#help-center)

With these tools and resources, you can track project activities, configure services, resolve technical issues, and more.

!!! note
    Details are subject to your legal agreement with Liferay. For information about legal agreements and services, see the [Liferay Legal](https://www.liferay.com/legal) page.

## Application Metrics

With Liferay Cloud’s built-in monitoring, you can track resources used by each environment service. These application metrics include memory, CPU usage, and network data transfer.

Metrics are available for the default Liferay Cloud stack services: Web Server, Liferay, Search, Database, and Backup. CI metrics are also available in the infra environment.

![View application metrics via the Monitoring page in the Liferay Cloud console.](./troubleshooting-tools-and-resources/images/01.png)

You can also integrate [Dynatrace’s](../manage-and-optimize/application-metrics.md#advanced-application-metrics-production-only) advanced performance monitoring with production environments.

See [Application Metrics](../manage-and-optimize/application-metrics.md) for more information.

## Real-Time Alerts

Liferay Cloud can alert system administrators of unexpected behaviors in a project. Examples of unexpected behaviors include auto-scaling events, higher than expected memory consumption, reaching the allotted CPU quota, and database connection issues.

View all environment alerts and set alert preferences via the Liferay Cloud console.

![View and manage alerts via the Alerts page in the Liferay Cloud console.](./troubleshooting-tools-and-resources/images/02.png)

See [Real-Time Alerts](../manage-and-optimize/real-time-alerts.md) for more information.

## Environment Activities

You can monitor environment activities via the Liferay Cloud console, where they are sorted into two sections: *Builds and Deployments* and *General Activities*.

View the status of builds, deployments, service activities, and more to help troubleshoot environment issues.

![View environment activities from the Liferay Cloud console.](./troubleshooting-tools-and-resources/images/03.png)

See [Team Activities](../manage-and-optimize/team-activities.md) for more information.

## Environment Logs

Environment logs are crucial for diagnosing and resolving technical issues in a project. Users can access and download environment logs via the Liferay Cloud console or your OS CLI.

Application, status, and build logs are provided for each Liferay Cloud Service:

- **Application Logs**: runtime information generated after the application is running and accessed by users
- **Status Logs**: orchestration layer information from the Kubernetes cluster
- **Build Logs**: build information generated as the application boots up

![View logs via the Logs page in the Liferay Cloud console.](./troubleshooting-tools-and-resources/images/04.png)

See [Log Management](./troubleshooting-tools-and-resources/reading-liferay-cloud-service-logs.md) for more information.

## Shell Access

Command line tools in the Liferay Cloud console contribute to the developer's workflow by delivering speed, control, traceability, scripting, and automation capabilities.

When troubleshooting issues, use the shell access tool to look inside your applications and see details not easily spotted in logs.

![Use the shell access tool in the Liferay Cloud console to see what's going on inside your application.](./troubleshooting-tools-and-resources/images/05.png)

The shell is accessible in most services, including the `liferay`, `search`, and `webserver` services. It can be used to access the server's file system directly and run commands for troubleshooting purposes.

For example, you can run the following command from the `liferay` service's shell to test connection to an address or external server:

```bash
curl -v [address]
```

See [Shell Access](./troubleshooting-tools-and-resources/shell-access.md) for more information.

## Self-Healing

Liferay Cloud's self-healing functionality detects if a service or application has become unresponsive and automatically initiates procedures to recover the unresponsive service. The platform uses probes to monitor the services.

Liferay Cloud offers two probes used in conjunction to manage applications:

- **Liveness Probe**: indicates whether the service is running
- **Readiness Probe**: indicates whether the service is ready to receive requests

See [Self-Healing](./troubleshooting-tools-and-resources/self-healing.md) for more information about configuring each probe.

## Disaster Recovery

In the event of a disaster, Liferay Cloud offers two strategies for project recovery: Automatic and Cross-Region.

Liferay Cloud's automatic disaster recovery strategy replicates services between three availability zones within the same region. If an availability zone becomes unavailable, the load balancer routes to the remaining availability zones automatically without the need for user action.

In a cross-region disaster, however, user intervention is required. To learn more about cross-region disaster recovery tools and processes, see [Configuring Cross Region Disaster Recovery](./troubleshooting-tools-and-resources/configuring-cross-region-disaster-recovery.md).

See [Disaster Recovery Overview](./troubleshooting-tools-and-resources/disaster-recovery-overview.md) to learn more about both disaster recovery strategies.

## Liferay Cloud Platform Status

When troubleshooting technical issues, be sure to check that all Cloud Platform systems are operational.

You can view the status of Liferay Cloud Platform systems, planned maintenance windows, and incident history from the [Liferay Cloud Platform](https://status.liferay.cloud) status page.

To receive notifications of changes in the Cloud Platform's status, click *Subscribe to Updates* and select your preferred method of notification.

![View the status of Liferay Cloud Platform systems.](./troubleshooting-tools-and-resources/images/06.png)

See [Liferay Cloud Platform Status](./troubleshooting-tools-and-resources/liferay-cloud-platform-status) for more information.

## Support Access

Support Access is an optional environment setting that expedites troubleshooting by giving Liferay engineers direct access to a Liferay Cloud project environment.

By default, Support Access is enabled in each project environment, though administrators can disable it from the *Settings* page.

![Environment administrators can enable or disable Support Access in the Settings page.](./troubleshooting-tools-and-resources/images/07.png)

See [Support Access](./liferay-cloud-support/support-access.md) for more information.

## Help Center

If you have questions not answered by Liferay Cloud [Documentation](https://learn.liferay.com/w/liferay-cloud/index) or want to report an issue, sign into the Liferay [Help Center](https://help.liferay.com) to view subscription-only resources or submit a ticket.

![View subscription-only resources or submit a ticket via the Liferay Help Center page.](./troubleshooting-tools-and-resources/images/08.png)

From here, you can access the Liferay Cloud [Knowledge Base](https://help.liferay.com/hc/en-us/categories/360001132872), [Product Support](https://help.liferay.com/hc/en-us/articles/360030208451-DXP-Cloud-Support-Overview), and [Announcements](https://help.liferay.com/hc/en-us/categories/360001192512).

You can also subscribe to receive email notifications of the latest Liferay Cloud [Help Center Updates](https://www.liferay.com/web/l/subscribe-to-liferay-dxp-cloud-updates). These updates include new platform releases, service updates, and security alerts and patches.

!!! note
    Liferay Cloud notifications are only distributed to customers with an active Liferay Enterprise Subscription.

For additional support, you can contact one of Liferay's global [Support Centers](https://help.liferay.com/hc/en-us/articles/360017784212?_ga=2.254167624.1908736764.1562000563-1350017715.1560788053) by phone or submit a ticket via the [Help Center](https://help.liferay.com/) page.

When submitting a ticket, please provide information regarding the build images currently in use, behavior or question you are facing, steps to reproduce the issue, and a description of both actual and expected behavior.

## Related Topics

- [Liferay Cloud Support Overview](https://help.liferay.com/hc/en-us/articles/360030208451-DXP-Cloud-Support-Overview)
- [Liferay Cloud Knowledge Base](https://help.liferay.com/hc/en-us/categories/360001132872)
- [Liferay Cloud Announcements](https://help.liferay.com/hc/en-us/categories/360001192512)
- [Support Access](./liferay-cloud-support/support-access.md)
