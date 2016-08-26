
##### Merchant's Guide to the Galaxy  
- - - -
### How to run
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
└───util
|       currencyconvert.rb
|       parseutil.rb
|       romanvalidatio.rb
```
### Features and addons
  - Build on Ruby 2.2.4
  - configurations like path is stored under conf/local.yml
  - details logs are generated in log/YYYYMMDD for each day
  - application is made in failsafe manner with capability to handle most of invalid queries
  - for test run we have two input [sample_input.txt for best case] and [sample_input_failcase.txt for failcase]
  - output is generated in output/output.txt file
