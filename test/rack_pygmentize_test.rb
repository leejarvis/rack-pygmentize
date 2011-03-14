class RackPygmentizeTest < MiniTest::Unit::TestCase
  def response(body, xpath="//pre[@lang]")
    builder = Rack::Builder.new
    builder.use Rack::Pygmentize, xpath
    builder.run proc { |e| [200, {'Content-Type' => 'text/html'}, [body]] }
    Rack::MockRequest.new(builder).get '/'
  end

  def test_replace_markup
    res = response(%Q(<pre lang="ruby">def foo; end</pre>))
    assert res.body.include?('<span class="k">')
  end

  def test_alternative_xpath
    res = response(%Q(<code lang="ruby">def foo; end</code>), '//code[@lang]')
    assert res.body.include?('<span class="k">')
  end

  def test_negative_alternative_xpath
    res = response(%Q(<pre lang="ruby">def foo; end</pre>), '//code[@lang]')
    assert !res.body.include?('<span class="k">')
  end

  def test_multiple_code_blocks
    res = response(%Q(
      <pre lang="ruby">def foo; end</pre>
      <pre lang="python">def foo:</pre>
    ))
    assert res.body.include?('python"><span')
    assert res.body.include?('ruby"><span')
  end
end