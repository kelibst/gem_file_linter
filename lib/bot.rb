class  Bot

    def initianize

    end
    
end

def add_gem(input, errors)

    if input.downcase == 'y'

      can_write = File.writable?('gem')
      puts can_write ? '---your file is writable---'.yellow : '---Sorry your file is not writable---'.red

      if can_write
        puts 'Awesome Enter your gem name.'
        input = gets.chomp
        puts "you did not enter anything.\n Exiting the game!" if input.empty?
        unless input.empty?

          file = File.open('gem', 'w') do |f|
            f.write "gem '#{input}'\n source 'https://rubygems.org'"
          end
          puts 'your file was successfully updated your gemfile with the gem name you entered'
        end
      end
    else
      #writing linter bot to check if code meets the requirements.
      file = File.open('gem', 'r')
      filedata = file.read
  
      #checking if filedata contains source
  
       filedata.include?("source 'https://rubygems.org'") ? '' : errors.push('Your Gemfile lacks a source url. All gem file should include a source Url.')
       filedata.include?('gem') ? '' : errors.push('Your Gemfile should include at least one gem')
     
  
      errors.each {|x| puts x.red}
    end
end

def input_gem
    errors = []
  if File.empty?('gem')
    puts "Do you want to add gems to your?\n
        enter Y/N".yellow

    input = gets.chomp

   add_gem(input, errors)

  end

end