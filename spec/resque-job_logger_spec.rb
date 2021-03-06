require 'spec_helper'

describe Resque::Plugins::JobLogger do
include PerformJob

  it "complies with recommended practices" do
    expect { Resque::Plugin.lint(Resque::Plugins::JobLogger) }.to_not raise_error
  end

  it "supplies the around_perform_log_job hook" do
    LoggedJob.methods.should include :around_perform_log_job
  end

  let(:logger) { Logger.new('log') }

  before(:each) do
    LoggedJob.logger = logger
    LoggedJob.logger.formatter = Resque::Plugins::JobLogger::Formatter.new
  end

  after(:each) do
    logger.close
    File.unlink('log')
  end

  let(:last) { rand(1_000_000..1_500_000) }

  it "logs job class and args at start of perform" do
    perform_job(LoggedJob, last)
    IO.read('log').should match /LoggedJob\(\[#{last}\]\) started/
  end

  it "writes elapsed run time to log" do
    perform_job(LoggedJob, last)
    IO.read('log').should match /LoggedJob\(\[#{last}\]\) completed in [0-9\.e-]+ seconds/
  end

  it "allows arbitrary log messages to be written via the logger method" do
    perform_job(LoggedJob, last)
    IO.read('log').should match /summing 1..#{last}/
  end
end
