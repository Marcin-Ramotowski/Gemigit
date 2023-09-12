# Gemigit

A self-hosted gemini Git service with Docker environment.

## Features

* Allow users to create and manage git repositories
* Private and public repositories
* Serving git repositories on the http protocol
* LDAP authentication
* 2FA with time-based one-time passwords
* Option to use token authentication when doing git operations
* Basic brute-force protection
* User groups
* Privilege system for read/write access
* Support for sqlite and mysql databases
* Support stateless mode for multiple instances and load balancing

## Setup

* You have to generate ssl private key and certificate for server. Sign cert and path to this file write in `config.yaml` as  value of `certificate` parameter. Write also path to your ssl private key as value of `key` parameter. Bind this files also to app container giving paths relative to `/app` directory. When creating, specify the server name by which you want to connect with this service. Attach files also as volumes in docker-compose.yml file.
* Write the server name into `/etc/hosts` file (on Windows `C:\Windows\System32\drivers\etc\hosts`).
* To service of Gemigit you have to use a Gemini client like Amfora. You have to generate also your own client certificate. Instructions about how generate and bind client certificate to Amfora client you find here: https://github.com/makew0rld/amfora/wiki/Client-Certificates.
* If you want you can bind also your own database by your own file or url to database service. Supported database management systems: Sqlite, Sqlite3 and Mysql. Write database type and connection string in `config.yaml` file. By default app data are saved into `data` directory on root of this repo.
* Execute command `docker-compose up -d` to build and run this service.

## Usage

* Enter the website by server name and number of port on which is running gemini protocol (if different than default 1965)
* Register on Gemigit giving the same username as you gave when you created your own client certificate.
* To work with git use port indicated in `config.yaml` file. Default is 5555. This part of service works on the HTTP protocol.
* To authenticate during using git use token generated on your account in Gemigit service.

## Demo

You can try a public instance of Gemigit at this address gemini://gemini.rmf-dev.com using a Gemini client or with a [gemini web proxy][0]

## Contact

For inquiries about this software or the instance running at gemini://gemini.rmf-dev.com, you can contact the main maintainer of this project at : rawmonk@firemail.cc

[0]: https://portal.mozz.us/gemini/gemini.rmf-dev.com/
