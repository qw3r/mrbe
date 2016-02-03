MRBE
____


Setup
_____


if you don't have a development machine, create one: `docker-machine create rails-dev`

setup the environment variables: `eval $(docker-machine env rails-dev)`
install the containers (only postgres, for now0 defined in the docker-compose config:
`docker-compose up` (next time just type: `docker-compose start` to run it w/o attaching
to the terminal, with otherwords: in the background)

now you should be able to run: `rake to run the tests`

