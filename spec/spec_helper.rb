require 'resque'
require 'resque-job_logger'

##
# Helper to perform job classes (borrowed from resque's test_helper.rb).
#
module PerformJob
  def perform_job(klass, *args)
    resque_job = Resque::Job.new(:testqueue, 'class' => klass, 'args' => args)
    resque_job.perform
  end
end

class LoggedJob
  extend Resque::Plugins::JobLogger

  def self.perform(last)
    logger.info "summing 1..#{last}"
    (1..last).reduce(:+)
  end
end
