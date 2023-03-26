# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Models

### Account

  $ bin/rails generate model Account email:index:uniq username:string{64} status:string{16}

### Article

    $ bin/rails generate model Article account:reference:index title:string{128} body:text status:string{16} lock_version:integer{8}

### Comment

    $ bin/rails generate model Comment account:reference:index article:reference:index content:text status:string{16}

### Message

    $ bin/rails generate model Message account:references:index subject:string{128} body:text status:string{16}

### Entry

    $ bin/rails generate model Entry account:references:index entryable:references{polymorphic}:index status:string{16}


# Let's Learn Ruby on Rails + Hotwire by Building a To-Do List

https://www.akshaykhot.com/building-to-do-list-using-hotwire-and-stimulus/

## Install Tailwind CSS

First, install the `tailwindcss-rails` gem that makes the setup painless.

```bash
$  bin/bundle add tailwindcss-rails
```

Then run the Tailwind installer, which will set up Tailwind for you, additionally setting up foreman, which makes running multiple processes very easy. For more details, check out [my post on Foreman](https://www.akshaykhot.com/launching-multiple-processes-using-foreman/).

```bash
$ bin/rails tailwindcss:install
```

OUTPUT:

    Add Tailwindcss include tags and container element in application layout
        insert  app/views/layouts/application.html.erb
        insert  app/views/layouts/application.html.erb
        insert  app/views/layouts/application.html.erb

    Build into app/assets/builds
        create  app/assets/builds
        create  app/assets/builds/.keep
        append  app/assets/config/manifest.js
        append  .gitignore
    Add default config/tailwindcss.config.js
        create  config/tailwind.config.js
    Add default app/assets/stylesheets/application.tailwind.css
        create  app/assets/stylesheets/application.tailwind.css
    Add default Procfile.dev
        create  Procfile.dev
    Ensure foreman is installed
            run  gem install foreman from "."
    Fetching foreman-0.87.2.gem
    Successfully installed foreman-0.87.2
    Parsing documentation for foreman-0.87.2
    Installing ri documentation for foreman-0.87.2
    Done installing documentation for foreman after 0 seconds
    1 gem installed
    Add bin/dev to start foreman
        create  bin/dev
    Compile initial Tailwind build
            run  rails tailwindcss:build from "."

    Rebuilding...

    Done in 444ms.