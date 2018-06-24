# Monitoring

There are some types of monitoring here

- Uptime of the website.
- Performance of the Wordpress code.
- Log monitoring.
- Exception from code.

## Uptime monitoring

This is what you care the most. If your website is down then it will notify you.

There are many services that you can use to monitor this

- [NewRelic](https://newrelic.com/)
- [Pingdom](https://pingdom.com/)
- ...

## Performance Monitoring

This will show you if your code has `N+1` SQL queries or the PHP processes are consume too much memory, etc. Basically it server & application monitoring.

Not so many options for APM. So far, [NewRelic](https://newrelic.com/) is the best for Wordpress since they support Wordpress by default.

## Log monitoring

Depends on which tool you are using e.g Apache or Nginx/PHP-FPM then you can collect different log files. 

Example with Nginx/PHP-FPM we can just get the Nginx's log

```
/var/log/access.log
/var/log/error.log
```

Better to use log management service like

- [Scalyr](https://www.scalyr.com/)
- [Logentries](https://logentries.com/)
- ...

They both provide agent that you can run on the server to collect and send the log to a central service. You can view and query the log from the web interface or using API to query.

## Exception tracking

You should capture code exceptions and send to service like

- [Rollbar](https://rollbar.com/)
- [Sentry](https://sentry.io/)
- ...

Depends on the exception you can decide to ignore or notify you or not.

If you use `NewRelic` then it will auto collect all the warning or exception from PHP and you can view that from its interface.

## Note

Continously benchmark the website to find out bottleneck and improve it. There are many great services that you can do this kind of audit

- [GTmetrix](https://gtmetrix.com/)
- [Webpagetest](https://www.webpagetest.org/)
- [Lighthouse](https://developers.google.com/web/tools/lighthouse/)
- ...
