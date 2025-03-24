# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    request = Rack::Request.new(env)

    case request.path
    when '/'      then [200, { 'Content-Type' => 'text/plain' }, ['Hello, World!']]
    when '/about' then [200, { 'Content-Type' => 'text/plain' }, ['About page']]
    else [404, { 'Content-Type' => 'text/plain' }, ['404 Not Found']] end
  end
end
