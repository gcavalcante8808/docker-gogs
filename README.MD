Semaphore Container
===================

This is a gcavalcante8808/gogs docker image based on Debian Offical Image.

Using Docker Compose
--------------------

Clone the repo into your machine and access the folder created. Then, use the following command:

```
    docker-compose up -d
```

The command will create a postgreSQL called gogsdb, which db, user and password are "gogs"; this information is need to finish the gogs installation.

After a few seconds, access the gogs interface in the address "http://localhost:80" or trough git/ssh "localhost:2220".


Note About "Gogs Container Restarting"
--------------------------------------

For fresh install, sometimes the permissions on gogs-repositories repo are incorrect; in this case, you can run the following command to fix it:

```
docker-compose exec gogs chown -R git:git /home/git/gogs-repositories/
```


Author
------

Author: Gabriel Abdalla Cavalcante Silva (gabriel.cavalcante88@gmail.com)


