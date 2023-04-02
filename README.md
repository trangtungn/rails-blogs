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

### Task

    $ bin/rails generate model Task account:references:index description:string{200}

---

## Models - stkp

### Admin

    $ bin/rails generate model Admin display_name:string

### Manager

    $ bin/rails generate model Manager display_name:string

### Member

    $ bin/rails generate model Member display_name:string username:string domain:string timezone:string

### AgentProfile

    $ bin/rails generate model AgentProfile account:references:index profileable:references{polymorphic}:index active:boolean


# Let's Learn Ruby on Rails + Hotwire by Building a To-Do List

- This section is referenced from Akshay's Blog: https://www.akshaykhot.com/building-to-do-list-using-hotwire-and-stimulus/

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


## How Turbo Drive Works
Turbo Drive intercepts all clicks on anchor links to the same domain. When you click a link or submit a form, Turbo Drive does the following:

- Prevent the browser from following the link,
- Change the browser URL using the History API,
- Request the new page using a fetch request
- Render the response HTML by replacing the current `<body>` element with the response and merging the `<head>` element’s content.

The JavaScript `window` and `document` objects as well as the `<html>` element persist from one rendering to the next.

The same goes for an HTML form. Turbo Drive converts Form submissions into fetch requests. Then it follows the redirect and renders the HTML response. As a result, your browser doesn’t have to reload, and the app feels much faster.

### Cross-Site Request Forgery vulnerability and CSRF tokens
- [Understanding Authenticity Tokens in Rails](https://www.akshaykhot.com/understanding-authenticity-tokens-in-rails/)

## Delegated Type
- [ActiveRecord::DelegatedType](https://api.rubyonrails.org/classes/ActiveRecord/DelegatedType.html)

- [Few extra pieces that fit nicely with the delegated types concept:](https://github.com/rails/rails/pull/39341#issuecomment-727252082)

    **N+1 prevention DSL sugar**

```ruby
module Entryable
  TYPES = %w[ List Spot ]
end
```

```ruby
class Entry < ApplicationRecord
  delegated_type :entryable, types: Entryable::TYPES

  scope :with_entryables, -> { includes(:entryable) }
end
```

Automatically matching entry's url helper based on the `entryable_type`

```ruby
Rails.application.routes.draw do
  direct :entry do |model|
    route_for model.entryable_name, model
  end
end
```

```ruby
class SpotsController < ApplicationController
  def create
    @entry = Entry.create! entryable: Spot.new(params.require(:spot).permit(:address))
    redirect_to @entry # Redirects to e.g. /spots/47, with 47 being the newly created Entry id.
  end
end
```

## Http Basic Authentication

```ruby
class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: 'user', password: 'pass'
```

### Config RSpec

```ruby
# spec/support/basic_auth.rb

module BasicAuth
  def http_login
    request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::Basic.encode_credentials('user', 'pass')
  end
end
```

```ruby
# spec/spec_helper.rb

require_relative 'support/basic_auth'

RSpec.configure do |config|
    ...
    config.include BasicAuth, :type => :controller
    ...
end
```

Usage:

```ruby
# spec/controllers/tasks_controllers.rb

RSpec.describe TasksController, type: :controller do

    describe "GET /index" do
        before do
            http_login
            get :index
        end

        ...
```
