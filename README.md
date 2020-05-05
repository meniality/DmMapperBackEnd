# README

* Ruby version 2.6.1

* Database creation: 
created with a postgres database. You will need to run these commands in your terminal to get it running.

1. rails db:create
2. rails db:migrate
3. rails db:seed
4. The front end is set up is to have this running from the heroku hosted version. If you wanted to run the database locally you would need to run this by running in terminal $rails   s --binding0.0.0.0   this allows access to the local server even from outside machines. This is neccesary because the front end code is either running on a simulator or on a physical device other than your local machine.

This is the backend desiqned to work with my custom built front end for the DM Mapper which can be found https://github.com/meniality/DmMapper

This is a backend RESTful API for my DM Mapper React Native Front End. The backend features full authentication using CORS, BCRYPT, and JWT gems. Routes are proctected and require a user to be logged in with an authorized JWT to adjust a user's information.
