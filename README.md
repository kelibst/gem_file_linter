# gem_file_linter
This is a linter to help correct errors in ruby gem files or to help create one if necessary. 

This program is a linter for Gemfiles in ruby.
  You might say well Ruby doesn't need Gemfile linter,
  but Hey! nothing is an overkill if it can do the work.





## Built With

- Ruby

### Run tests
To preserve the configuration file of this project,
the script is set to run on a 'gem' instead of the  original Gemfile. You can change that by setting the global variable  gem_file = 'Gemfile'

Make sure you have ruby installed and run:
- bin/main.rb  

- The rspec test files are located in the spec folder.

Make sure you have bundler installed and run:
- bundle exec rspec spec/bot_rspec.rb

## Functionalities

If you do not have a "gem" file in your working directory, the project will request to create one for you. Then ask to fill it.
If you do have a gem file, The script checks if it includes at least one gem and at least one source url.




## Authors

👤 **Kelly Booster**

- Github: [@kelibst](https://github.com/kelibst)
- Twitter: [@keli_booster](https://twitter.com/keli_booster)
- Linkedin: [Kekeli (Jiresse) Dogbevi
](https://www.linkedin.com/in/kekeli-dogbevi-958272108/)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse
- The Odin Project
- Codecademy

## 📝 License

This project is [MIT] licensed.