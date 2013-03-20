# Resque Job Logger

Resque Job Logger adds log entries which indicate the start and elapsed
run time of each job's perform method.

## Installation

Add this line to your application's Gemfile:

    gem 'resque-job_logger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install resque-job_logger

## Usage

Just require it. resque-job_logger includes a before_fork hook which
automatically adds its features to each of your jobs. This may be a bad
thing.

resque-job_logger also has its own Logger::Formatter which it uses by default.
To use another formatter do

    Resque.logger.formatter = MyFavoriteFormatter.new

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
