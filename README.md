# Introduction
This is an audacious attempt to start up a SilverStripe based docker-compose environment that uses Redis for session management without even needing PHP installed in your environment. 

PHPMyAdmin will also be installed out of the box for you.

## How it works
1. Creates a temporary docker container using brettt89's latest image
2. Downloads and copies composer.phar into this container for use next
3. Runs ./composer.phar create-project silverstripe/installer within the newly minted container
4. Once installed, it copies all the silverstripe files to the host machine
5. Stops and deletes the temporary container
6. Attempts to build and bring up a docker-compose environment

## Setup
Clone project then, 
setup a .env file in the root as per the env.example, 
then run `./start.sh`

Once that's done you should visit www.<your-domain>.localhost and you should have a fully functional SS4 site up and running.

Beware, re-running ./start.sh will remove any work saved. I'm still to make this optional.