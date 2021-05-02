$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "fantasy_identifiable"
require 'active_record'

require "minitest/autorun"

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'

load "#{File.dirname(__FILE__)}/db/schema.rb"
require "#{File.dirname(__FILE__)}/db/models.rb"
