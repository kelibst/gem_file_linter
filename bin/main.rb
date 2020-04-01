#!/usr/bin/env ruby
require 'colorize'
require_relative '../lib/bot.rb'
require_relative '../lib/help.rb'

def start

  linter = Bot.new
  # let's check if the Gemfile exist and has some contents in it
  if File.exist?('gem')
    linter.input_gem
  elsif !File.exist?('gem')
    puts "Sorry you do not have Gemfile in your working folder.

            Would you want us to create it for you?

            Y/N".yellow

    create_gem_input = gets.chomp

    unless create_gem_input.downcase == 'n'
      file = File.open('gem', 'w')
      linter.input_gem
    end
    puts 'Exiting... Bye!'.green if create_gem_input.downcase == 'n'
  end
end



start
