Gem::Specification.new do |s|
  s.name        = "rack-pygmentize"
  s.version     = "1.0.2"
  s.authors     = ["Lee Jarvis"]
  s.email       = ["lee@jarvis.co"]
  s.homepage    = "http://github.com/injekt/rack-pygmentize"
  s.summary     = %q{Rack middleware to pygmentize your code blocks}
  s.description = %q{Rack middleware used to automagically format your code blocks using pygmentize}
  s.files         = %w(lib/rack/pygmentize.rb Rakefile Gemfile LICENSE README.md .gemtest examples/rack-pygmentize.rb)
  s.test_files    = %w(test/rack_pygmentize_test.rb)
  s.add_runtime_dependency('rack', '~> 1.0.0')
  s.add_runtime_dependency('nokogiri', '~> 1.4.4')
  s.add_runtime_dependency('albino', '~> 1.3.2')
end
