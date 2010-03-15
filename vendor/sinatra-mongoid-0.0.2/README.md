Sinatra Mongoid
===============

A Mongoid extension for Sinatra.

Usage
-----

Gemfile:

    gem 'sinatra'
    gem 'sinatra-mongoid', :require_as => 'sinatra/mongoid'

Bundle:

    gem bundle

Create your Sinatra app:

    require File.dirname(__FILE__) + '/vendor/gems/environment'
    Bundler.require_env

    set :mongo_db, 'db-name'

Configuration
-------------

All Sinatra options you can set are:

    :mongo_host
    :mongo_db
    :mongo_port
    :mongo_user
    :mongo_password

Their default values are:

    ENV['MONGO_HOST'] || 'localhost'
    ENV['MONGO_DB']   || 'changme'
    ENV['MONGO_PORT'] || Mongo::Connection::DEFAULT_PORT
    ENV['MONGO_USER']
    ENV['MONGO_PASSWORD']

Resources
---------

* [Mongoid](http://mongoid.org)
* [Sinatra](http://sinatrarb.com)

Authors
-------

Dan Croak, Justin Reidy.
