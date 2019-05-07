 # Raven-Kart 

This is a simple e-commerce project for GOT fans. It is designed to sell the show's products.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

## Prerequisites

### Ruby version 
```
2.6.1
```

### System dependencies

You need to install **Redis-Server** and change Java version to **Java JDK-8 JRE**.

``` bash
sudo apt install redis-server #to install Redis-Server
sudo systemctl restart redis.service 
```
To change the Java version

```bash
sudo update-alternatives --config java
```
Use `java -version` to check your current version.


As for the database we are using **mysql**.
### Installing

After cloning the project, you need to run


```rails
bundle install
```
You need to create `config/local_env.yml` and `config/environments/env.yml`. 
 `local_env.yml' will hold environment variables used for database creation.
First, you need to create it.
```bash
touch config/local_env.yml
```
Edit `local_env.yml` and add the following variables with your own username, password, and database name.
```yml
RAVEN_KART_DATABASE_USER: xxxxxxx
RAVEN_KART_DATABASE_PASSWORD: xxxxxxxx
RAVEN_KART_DATABASE_DEVELOPMENT: xxxxxxx
```
Now, we need to create `env.yml`. This file holds Gmail credentials for email confirmation and authentication purposes.  
```bash
touch config/environments/env.yml
```
Edit `config/environments/env.yml` and add the following variables with your own email and password.
```yml
SENDMAIL_USERNAME: xxxxxxxxxx
SENDMAIL_PASSWORD: xxxxxxxxxx
MAIL_HOST: Localhost:3000
```
#### Database Creation
To create your database
 
```rails
rake db:create
```
To run the migration
```rails
rails db:migrate
```
>**_Note: Do not seed the DB in this step, we need to run the server first._**

To run the server use
```rails
rake run
```
>**_Note: Do not `rails server`_**

To stop the server use
```rails
rake stop
```
>**_Note: Do not exit using `ctrl+c`_**

Now, we need to check that the server is running correctly.
```rails
rake run
```
If it runs perfectly, you can skip this step.
If you are faced with an error `connect(2)` that means you **Java** version need to be changed. 
otherwise, you only need to stop the server and run it again.

#### Database initialization
While the **server is running**, you can now seed your database.
```rails
rails db:seed
``` 
then stop the server and run it again to reindex **Sunspot Search Engine**.

With that, you can register or use any of the seeded accounts.

You now have an admin account which you can log in by
```yml
email: admin@example.com
password: password
```
### Docker image
Inside `config/dockercommands` you will find all the commands you need to run the docker image.

## Database Design
[ERD](Simple-ecommerce.jpeg)
[Schema](Schema.pdf)

## Jobs and Workers

we have three jobs that are run by two workers on 3 Queues
#### Jobs
```jobs
Image Upload
Mailer
Coupon Expiration
```
#### Workers
```workers
Resque Worker
Resque Scheduler 'CouponExpireDateJob'
```

#### Queues
```queues
Mailer
Default
Coupon
```


##Rake Run
Rake Run command was made to ensure that starting the application was easy
on whom ever that runs it and it's made up of five commands

```run
rails s
rake sunspot:solr:start
rake resque:scheduler 
rake resque:work
rake sunspot:reindex
```
#### rails s
Starts the rails server

#### rake sunspot:solr:start
Starts the sunspot solr search engine

>**_Note: A must for the application to run_**

#### rake resque:scheduler 
Starts the scheduler for the coupon expiration worker

#### rake resque:work
Start the default resque worker for the mail and image upload jobs

#### rake sunspot:reindex
Reindex the search columns for the search engine
>**_Note: A must for the search to work_**

## Rake Stop
Rake Stop command was made to stop the rails server, workers , sunspot solr
by killing the process by it's id that was stored during rake run

#### rake sunspot:reindex
Stops the sunspot solr server




