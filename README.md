MRBE
____

Setup
_____

I run postgres using docker.

On OSX I'm using docker-machine. When the machine is running and the
env variables are set, I can run the docker-compose to bring up the container.

`docker-machine create mrbe -d virtualbox` and then setup the environment variables:
`eval $(docker-machine env mbre)`

Now you can (pull and) start the postgres
`docker-compose up` (next time: `docker-compose start`)


and now the usual:

```
bundle install
rake db:setup
rake db:seed
```