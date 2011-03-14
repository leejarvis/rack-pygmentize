task :test do
  require './lib/rack/pygmentize'
  require 'minitest/autorun'
  begin; require 'turn'; rescue LoadError; end
  require_relative './test/rack_pygmentize_test'
end