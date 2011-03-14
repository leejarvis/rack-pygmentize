Rack::Pygmentize
================

Get colorful with Rack::Pygmentize! Rack::Pygmentize uses the awesome
[Pygments](http://pygments.org/) library to make your code look pretty!
Thanks to [Albino](https://github.com/github/albino) the Pygmentizing
process is super awesome and made of win.

Installation
------------

Ensure you have [Pygments](http://pygments.org/) installed and the
`pygmentize` executable is available in your `PATH`. Then run

	gem install rack-pygmentize

Usage
-----

Just add `use Rack::Pygmentize` to your `config.ru`. See the example
in the `/examples` directory.