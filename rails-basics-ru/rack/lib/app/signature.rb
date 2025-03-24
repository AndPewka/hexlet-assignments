# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    puts "Signature"
    status, headers, body = @app.call(env)

    body_string = body.each.map(&:to_s).join

    signature = Digest::SHA256.hexdigest(body_string)

    new_body = [body_string, signature]

    [status, headers, new_body]
    # END
  end
end
