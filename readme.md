
##### Merchant's Guide to the Galaxy  
- - - -
### How to run application
 This application is supported by bundle and rake, from home directory type following command
 ```sh
 $ bundle install
 $ rake
```
or to manually run it
```sh
$ bundle install
$ bin/initiator.rb
```
### How to run rspec test cases
 ```sh
 $ bundle install
 $ rake test
```
or to manually run it
```sh
$ rspec spec/specmain.rb
```
### Project Structure
```
project
|   Gemfile
|   Rakefile
|   README.md
└───bin
|       initiator.rb
└───conf  
|       local.yml
└───input
|        sample_input_failcase.txt
|        sample_input.txt
└───output
└───log
└───spec
|       spec_helper.rb
|       specmain.rb
└───util
|       currencyconvert.rb
|       parseutil.rb
|       romanvalidatio.rb
```
### Features and addons and limitations
  - Build on Ruby 2.2.4
  - configurations like path is stored under conf/local.yml
  - details logs are generated in log/YYYYMMDD for each day
  - application is made in failsafe manner with capability to handle most of invalid queries
  - for test run we have two input [sample_input.txt for best case] and [sample_input_failcase.txt for failcase]
  - test cases can be found in spec/specmain.rb
  - output is generated in output/output.txt file
  - text should be defined in order taking care of spaces else program will not be able to understand it
