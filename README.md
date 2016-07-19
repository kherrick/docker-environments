bolt
=========

###To launch the containers and use Bolt:

* [Get the required dependencies](https://www.docker.com/products/docker):
  - Docker Engine 1.11.2+
  - Docker Compose v1.7.1+

* Clone the repository and build the containers (the first time may take awhile):
  - `$ git clone https://github.com/kherrick/docker-environments bolt`
  - `$ cd bolt`
  - `$ git checkout bolt`
  - `$ bin/build`

* To turn off the containers:
  - `$ bin/docker-helper stop`

* To turn on the containers:
  - `$ bin/docker-helper start`

* Browse to the site:
  - [http://localhost:8080](http://localhost:8080)
