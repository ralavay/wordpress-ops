# Wordpress Ops

The right way to develop and do CI/CD for your Wordpress sites.

## Wordpress :)

"Haizz... Again :(" - this is what I (or maybe you also) say when I have to setup a Wordpress site.

Maybe you don't like `PHP` and you don't want to upgrade tons of plugins and Wordpress version every month or week (or even day). Half of your working hours is on reading bugs, vulnerabilies about Wordpress eco-system? Sometimes, you dreamed about it?

Wordpress is boring and for noobs only? Everyone can publish something, check SEO, customise the images size and quality, get a nice dashboard report, etc. Yeah, these are the main reasons why you have to set it up.

## Problems

Wordpress relies on MySQL to store data and configuration so it is neat. Just download Wordpress release zip file, extract it somewhere and let's Apache or PHP-FPM/Nginx run that.

In general, your Wordpress development is for themes and plugins. Wordpress store all of these in `wp-content/` folder. Usually Wordpress admin can simple click and clicks to install a new theme or plugin inside Wordpress admin panel.

There are some issues

- Hard to replicate stuff from staging > pre-production > production. You can do the same "clicks" when you have to setup a new environment.
- Wordpress offer some config files like `wp-config.php` where you can just add the MySQL login credential and keep the file on server. This is not manual and not a good practise also.
- You give PHP process more permission on server which means higher risks e.g write permission to many folders like themes, plugins then you have a higher chance to get hacked because of the future bugs :)


## Solutions

- Let's use `Git`.

We only have to store `plugins` and `themes` since we only want to modify these files. Most of the time you only have to download the plugin code and add there without changing anything.

- Only give enough permission to Wordpress/PHP process in servers.

You can keep track of all public plugins and your plugins. In the server Wordpress only need read permission to all of these which is great.

- Use environment variables

Then you don't have to hardcode the MySQL password in wp-config.php. You can export necssary variables to ENV depends on your configuration management.

Note that ENV has its own problem. It is not really fix the issue of plaintext password in wp-config.php. It is more about flexibility in term of configuration. E.g you can easily swap from running Wordpress from EC2 to Docker without changing the config of where you put the secrets.

- CI/CD to rescue

Depends on your complexity of your project then you can have a different Git flow. Base on that flow you can decide how to release to staging up to production.










