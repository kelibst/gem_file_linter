#!/usr/bin/env ruby
   
def input_gem
    errors = []
  if File.empty?('gem')
    puts "Hello your Gemfile is empty.\n
        Do you want to add gems to it?\n
        enter Y/N"

    input = gets.chomp

    if input.downcase == 'y'

      can_write = File.writable?('gem')
      puts can_write ? 'your file is writable' : 'Sorry your file is not writable'

      if can_write
        puts 'Awesome Enter your gem name.'
        input = gets.chomp
        puts "you did not enter anything.\n Exiting the game!" if input.empty?
        unless input.empty?

          file = File.open('gem', 'w') do |f|
            f.write "gem '#{input}'\n source 'https://rubygems.org'"
          end
          puts 'your was successfully updated your gemfile with the gem name you entered'
        end
      end

    end
else
    #writing linter bot to check if code meets the requirements.
    file = File.open('gem', 'r')
    filedata = file.read

    #checking if filedata contains source

     filedata.include?("source 'https://rubygems.org'") ? '' : errors.push('Your Gemfile lacks a source url. All gem file should include a source Url.')
     filedata.include?('gem') ? '' : errors.push('Your Gemfile should include at least one gem')
    puts 'calling the bot to  work'

    errors.each {|x| puts x}
   end

end

def start
  # let's check if the Gemfile exist and has some contents in it
  if File.exist?('gem')

    input_gem

  elsif !File.exist?('gem')
    puts "Sorry you do not have Gemfile in your working folder.

            Would you want us to create it for you?

            Y/N"

    create_gem_input = gets.chomp

    unless create_gem_input.downcase == 'n'
      file = File.open('gem', 'w')
      input_gem
    end
    puts 'Exiting... Bye' if create_gem_input.downcase == 'n'
  end
end

def help
  helping = "This program is a linter for Gemfiles in ruby.
You might say well Ruby doesn't need Gemfile linter,
buy Hey! nothing is an overkill if it can do the work."

  puts helping
end

start
