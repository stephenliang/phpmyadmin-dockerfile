# What is phpMyAdmin?

![phpmyAdmin](http://www.phpmyadmin.net/home_page/images/logo.png)

phpMyAdmin is a free and open source tool written in PHP intended to handle the administration of MySQL with the use of a web browser. It can perform various tasks such as creating, modifying or deleting databases, tables, fields or rows; executing SQL statements; or managing users and permissions.

# How to use this image

## Running the installer

phpMyAdmin requires a configuration file. If you already have one, you can skip this step. However, if you are creating your first phpMyAdmin instance, you can run this image without the configuration files which will allow you to run the installer session.

To start phpMyAdmin installer

	docker run --link mysql:db -p 80:80 -p 443:443 -d simplyintricate/phpmyadmin

Then on a web browser, go to the docker host's server setup folder. For example, if you are running phpMyAdmin on your local computer, go to [http://localhost/setup](http://localhost/setup).

The installer will ask a series of questions and generate a config file for you. Save this file for the next step.

## Running phpMyAdmin

Once you have `config.inc.php`, you can start phpMyAdmin and run it normally by mounting the config to the container. You will also have to provide an image folder so that you can upload to your Wiki as well.

	sudo docker run -v <path to config.inc.php>:/usr/share/nginx/html/config.inc.php:ro --link mysql:db -p 80:80 -p 443:443 -d simplyintricate/phpmyadmin

Note that if you are linking a live mysql container, the hostname is the second operand. In this example, the hostname is `db`.

To help maintain immutability of the container, you may extend this image to include your config.inc.php into your own version of phpMyAdmin. Here is a sample Dockerfile for that

	FROM simplyintricate/phpMyAdmin

	RUN mkdir /usr/share/nginx/html/config
	ADD config.inc.php /usr/share/nginx/html/config.inc.php

## Contributing

You can help make this Dockerfile better by contributing at [Github](https://github.com/stephenliang/phpmyadmin-dockerfile)

If you found this Docker image helpful, send a tip via Bitcoin to 14b9y1Qw17coEkJFaAAvuXpKZLadTeBPw7
