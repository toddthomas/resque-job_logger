require 'logger'

module Resque::Plugins
  module JobLogger
    class Formatter
      def call(severity, time, progname, msg)
        "[#{time.strftime("%Y-%m-%dT%H:%M:%S.%N")}] #$$: [#{severity}] #{msg}\n"
      end
    end
  end
end
