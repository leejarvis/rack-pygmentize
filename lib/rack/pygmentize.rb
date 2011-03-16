require 'rack'
require 'nokogiri'
require 'albino'

module Rack
  class Pygmentize
    def initialize(app, xpath="//pre[@lang]")
      @app, @xpath = app, xpath
    end

    def call(env)
      dup.call!(env)
    end

    def call!(env)
      @env = env.dup
      status, headers, body = @app.call(@env)

      if headers['Content-Type'] && headers['Content-Type'].include?('text/html')
        headers.delete('Content-Length')
        Rack::Response.new(parse(body), status, headers).finish
      else
        [status, headers, body]
      end
    end

  private

    def parse(body)
      doc = Nokogiri::HTML(body[0])
      doc.search(@xpath).each do |pre|
        code = Albino.colorize(pre.text.rstrip, pre[:lang])
        pre.inner_html = code[28 .. -13]
      end
      doc.to_s
    end

  end
end