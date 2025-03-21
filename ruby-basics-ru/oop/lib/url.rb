# frozen_string_literal: true

require 'uri'
require 'forwardable'

# BEGIN
class Url
  extend Forwardable
  include Comparable

  def_delegators :@uri, :scheme, :host, :port

  def initialize(url)
    @uri = URI.parse(url)
  end

  def query_params
    return {} if @uri.query.nil?

    @uri.query.split("&").each_with_object({}) do |str, params|
      key, value = str.split("=")
      params[key.to_sym] = value
    end
  end

  def query_param(key, default = nil)
    query_params.fetch(key, default)
  end

  def ==(other)
    return false unless other.is_a?(Url)

    scheme == other.scheme &&
      host == other.host &&
      port == other.port &&
      query_params == other.query_params
  end
end
# END
