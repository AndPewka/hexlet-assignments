# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    dup._call env
  end

  def _call(env)
    request = Rack::Request.new(env)
    I18n.locale = extract_locale_from_accept_language_header(env) || I18n.default_locale
    @app.call(env)
  end

  private

  def extract_locale_from_accept_language_header(env)
    header = env['HTTP_ACCEPT_LANGUAGE']
    return nil if header.nil? || header.empty?

    locales = header.split(',').map do |lang|
      lang.split(';').first.to_s.downcase.strip[0..1]
    end

    locales.find { |loc| I18n.available_locales.map(&:to_s).include?(loc) }
  end
  # END
end
