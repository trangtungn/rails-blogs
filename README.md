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