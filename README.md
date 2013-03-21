# Resque Job Logger

Resque Job Logger adds log entries which indicate the start and elapsed
run time of each job's perform method, like so:

    [2013-03-20T17:28:34.316202000] 77415: [INFO] LoggedJob([1127520]) started
    [2013-03-20T17:28:34.316268000] 77415: [INFO] summing 1..1127520
    [2013-03-20T17:28:34.357921000] 77415: [INFO] LoggedJob([1127520]) completed in 0.041629 seconds

(The middle entry is supplied by the example job's perform method.)

This example also shows the style of resque-job_logger's own formatter,
Resque::Plugins::JobLogger::Formatter (see Usage below).

You may ask yourself, what use is this when the entries are timestamped,
and the resque worker already logs something like job start and end? I'm
glad you asked. Background jobs by nature may take a long time to run,
so finding widely-separated start and end log messages on a busy system
might take an extra few seconds. Resque Job Logger restores precious
seconds to your life! Also, I wanted a different formatter.

## Installation

Add this line to your application's Gemfile:

    gem 'resque-job_logger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install resque-job_logger

## Usage

Just bundle it! Or if you're not using bundler, just require it:

    require 'resque-job_logger'

resque-job_logger includes a resque before_fork hook which automatically adds its
features to each of your jobs. This may be a bad thing.

resque-job_logger also has its own formatter which it sets on
Resque.logger by default. To use another formatter do

    Resque.logger.formatter = MyFavoriteFormatter.new

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
