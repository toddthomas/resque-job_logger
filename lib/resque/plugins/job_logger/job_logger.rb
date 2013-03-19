require_relative 'formatter'
require 'benchmark'

module Resque::Plugins
  module JobLogger
    def around_perform_log_job(*args)
      logger.info "#{args} started"
      time = Benchmark.realtime do
        yield
      end
      logger.info "#{args} completed in #{time} seconds"
    end

    def self.enabled?
      @enabled ||= true
    end

    def self.enabled=(enabled)
      @enabled = enabled
    end

    def logger=(logger)
      @@logger = logger
    end

    def logger
      @@logger ||= Resque.logger
    end
  end

  Resque.before_first_fork do
    # You get our awesome formatter by default if you're using this plugin.
    Resque.logger.formatter = Resque::Plugins::JobLogger::Formatter.new
  end

  # Extend job class dynamically for each instance (if enabled).
  # For some reason extending the job class when it is defined does not
  # seem to be effective at the point at which the worker runs an instance
  # of the job.
  Resque.before_fork do |job|
    if Resque::Plugins::JobLogger.enabled? && 
      !(job.payload_class.kind_of?(Resque::Plugins::JobLogger))
      job.payload_class.send(:extend, Resque::Plugins::JobLogger)
    end
  end
end
