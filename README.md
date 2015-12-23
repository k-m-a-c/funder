== README

##Summary

Funder is a small, responsive web application designed, primarily, to let Ontario Members of Provincial Parliament see what organizations in a given provincial riding are receiving funding from the Ontario government, and to provide some details around the amounts and sources of these funds.

The app itself is written predominately in Ruby 2.2.2/the latest version of jQuery, and is built atop Rails 4.2.4 with a PostgreSQL database.

Currently, the app is hosted on Heroku, which was chosen to minimize time spent on environment set up and operations during its tight development timeline, and is accessible at `http://csi-funder.herokuapp.com/`.

The application's database contains a static dataset composed of 5 lists of data associated in various ways:

*Members of Provincial Parliament:* (2015) Sourced from the Open North API at https://represent.opennorth.ca/api/

*Ministries:* Sourced from an excel sheet provided by CSI Digital `/ministries.xlsx`

*Organizations:* Sourced from an excel sheet provided by CSI Digital `/organizations.xlsx`

*Ridings:* Composed via use of a web scraper that manually queried Elections Canada data based upon addresses imported from the Google Places API.

*Transfer Payments:* Sourced from an excel sheet provided by CSI Digital `/transfer_payments.xlsx`

##Deployment

*First*

Should you wish to deploy the application somewhere other than Heroku, you will first need to configure a server, running your chosen OS, with Funder's dependencies, which mostly boil down to installing specific versions of Ruby, Bundler, Rails, and PostgreSQL.

For a comprehensive guide to setting up Ruby on Rails on Ubuntu, I recommend [this DigitalOcean tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-14-04).

For a similarly comprehensive guide to installing postgreSQL on Ubuntu, I recommend [this other tutorial on DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-14-04) (they write a lot of great tutorials).

*Second*

Populate (a.k.a. "restore") the postgreSQL database from a the project's SQL dump file [funder.dump](https://dl.dropboxusercontent.com/u/30819827/funder.dump).

For a comprehensive guide to restoring a postgreSQL database from a SQL dump, I recommend [this tutorial](http://www.thegeekstuff.com/2009/01/how-to-backup-and-restore-postgres-database-using-pg_dump-and-psql/).

*Third*

Deploy the application.

For a comprehensive guide to deploying a Rails application, I recommend [this DigitalOcean tutorial](https://www.digitalocean.com/community/tutorials/how-to-deploy-a-rails-app-with-git-hooks-on-ubuntu-14-04).
