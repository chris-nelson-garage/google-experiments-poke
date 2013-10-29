google-experiments-poke
=======================

Poke your Google Experiment with capybara-webkit code that produces a known dataset to validate against.

## How to use

1. Clone the repo
2. Install Qt, needed for capybara-webkit, [following these instructions.](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit)
2. `bundle install`
2. Set the project host in spec_helper
3. Set goals / click rates / # of cycles in the spec file
4. run with `rspec`
5. ...
6. Profit?
