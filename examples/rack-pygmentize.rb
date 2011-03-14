require '../lib/rack/pygmentize'

str = DATA.read
app = proc {|e| [200, {'Content-Type' => 'text/html'}, [str]] }
builder = Rack::Builder.new
builder.use Rack::Pygmentize
builder.run app
Rack::Handler::WEBrick.run(builder, :Port => 3000)

__END__
<html>
<head>
  <title>Hello</title>
	<style type="text/css">
	pre {line-height:150%;font-family:Monaco, monospace;font-size: 12px;padding:10px;border-top:1px solid #ccc;border-bottom:1px solid #ccc;}
	pre .c{color:#998;font-style:italic;}
	pre .err{color:#a61717;background-color:#e3d2d2;}
	pre .k{font-weight:bold;}
	pre .o{font-weight:bold;}
	pre .cm{color:#998;font-style:italic;}
	pre .cp{color:#999;font-weight:bold;}
	pre .c1{color:#998;font-style:italic;}
	pre .cs{color:#999;font-weight:bold;font-style:italic;}
	pre .gd{color:#000;background-color:#fdd;}
	pre .gd .x{color:#000;background-color:#faa;}
	pre .ge{font-style:italic;}
	pre .gr{color:#a00;}
	pre .gh{color:#999;}
	pre .gi{color:#000;background-color:#dfd;}
	pre .gi .x{color:#000;background-color:#afa;}
	pre .go{color:#888;}
	pre .gp{color:#555;}
	pre .gs{font-weight:bold;}
	pre .gu{color:#800080;font-weight:bold;}
	pre .gt{color:#a00;}
	pre .kc{font-weight:bold;}
	pre .kd{font-weight:bold;}
	pre .kp{font-weight:bold;}
	pre .kr{font-weight:bold;}
	pre .kt{color:#458;font-weight:bold;}
	pre .m{color:#099;}
	pre .s{color:#d14;}
	pre .na{color:#008080;}
	pre .nb{color:#0086B3;}
	pre .nc{color:#458;font-weight:bold;}
	pre .no{color:#008080;}
	pre .ni{color:#800080;}
	pre .ne{color:#900;font-weight:bold;}
	pre .nf{color:#900;font-weight:bold;}
	pre .nn{color:#555;}
	pre .nt{color:#000080;}
	pre .nv{color:#008080;}
	pre .ow{font-weight:bold;}
	pre .w{color:#bbb;}
	pre .mf{color:#099;}
	pre .mh{color:#099;}
	pre .mi{color:#099;}
	pre .mo{color:#099;}
	pre .sb{color:#d14;}
	pre .sc{color:#d14;}
	pre .sd{color:#d14;}
	pre .s2{color:#d14;}
	pre .se{color:#d14;}
	pre .sh{color:#d14;}
	pre .si{color:#d14;}
	pre .sx{color:#d14;}
	pre .sr{color:#009926;}
	pre .s1{color:#d14;}
	pre .ss{color:#990073;}
	pre .bp{color:#999;}
	pre .vc{color:#008080;}
	pre .vg{color:#008080;}
	pre .vi{color:#008080;}
	pre .il{color:#099;}
	</style>
</head>
<body>

  <h1>Ruby</h1>
  <pre lang="ruby">
    def hello(item)
      puts 'Hello ' + item + '!'
    end
  </pre>

  <h1>Python</h1>
  <pre lang="python">
    def hello(item):
      print 'Hello ' + item + '!'
  </pre>

</body>
</html>