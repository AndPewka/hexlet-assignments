# frozen_string_literal: true

require 'digest'

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    puts "ExecutionTimer"
    start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC, :microsecond)

    status, headers, body = @app.call(env)

    end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC, :microsecond)
    elapsed = end_time - start_time

    body_array = body.each.map(&:to_s)
    body_array << "Execution time: #{elapsed}μs"

    [status, headers, body_array]
    # END
  end
end
