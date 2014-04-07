# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'resque/plugins/job_logger/version'

Gem::Specification.new do |gem|
  gem.name          = "resque-job_logger"
  gem.version       = Resque::Plugins::JobLogger::VERSION
  gem.authors       = ["Todd Thomas"]
  gem.email         = ["todd.thomas@openlogic.com"]
  gem.description   = %q{A resque plugin which logs the time it takes a job's perform method to run.}
  gem.summary       = %q{A resque plugin which logs the time it takes a job's perform method to run.}
  gem.homepage      = "https://github.com/toddthomas/resque-job_logger"

  gem.add_dependency "resque", "~> 1.25"

  gem.add_development_dependency "rspec"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
