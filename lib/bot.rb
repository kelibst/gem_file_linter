class LinterBot
  attr_reader :gem_file
  attr_writer :gem_file

  def initialize(gem_file)
    @gem_file = gem_file
    @errors = []
  end

  def display_gem_file
    file = File.open(@gem_file, 'r')
    filedata = file.read
    file.close
    filedata
  end

  def file_prepend(file, new_str)
    new_contents = ''
    File.open(file, 'r') do |fd|
      contents = fd.read
      new_contents = new_str << contents
    end

    File.open(file, 'w') do |fd|
      fd.write(new_contents)
    end
  end

  def all_errors
    display_gem_file.include?('source') ? '' : @errors.push('Your Gemfile lacks a source url.')
    display_gem_file.include?('gem') ? '' : @errors.push('Your Gemfile should include at least one gem')
    display_gem_file.include?('https://rubygems.org') ? '' : @errors.push('You did not include ruby source url')

    @errors
  end

  def can_write_file?
    can_write = File.writable?(@gem_file)
    puts can_write ? '---your file is writable---'.yellow : '---Sorry your file is not writable---'.red
    can_write
  end

  def success
    puts 'your file was successfully updated your gemfile with the gem name you entered'
    puts display_gem_file.green
  end

  def not_empty(input = '')
    while input.empty?
      input = gets.chomp
      puts 'Please enter a valid gem name.!' if input.empty?
    end
    input
  end

  def input_gem
    puts "Do you want to add gems to your?\n
            enter Y/N".yellow

    input = gets.chomp
    add_gem(input)
    input
  end

  private

  def gem_add(input)
    if File.empty?(@gem_file)
      file = File.open(@gem_file, 'w')
      file.write "gem '#{input}'\n source 'https://rubygems.org'"
      file.close
      success

    elsif !File.empty?(@gem_file)
      file_prepend(@gem_file, "gem '#{input}'\n")
      success
      all_errors.each { |x| puts x.red }
    end
  end

  def add_gem(input)
    if input.downcase == 'y'

      if can_write_file?
        puts 'Awesome Enter your gem name.'

        gem_add(not_empty)
      end
    else
      # writing  LinterBot to check if code meets the requirements.
      all_errors.each { |x| puts x.red }
    end
  end
end
