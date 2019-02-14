require_relative 'advice'

class HelloWorldThird
  CONTENT_TYPE = { 'Content-Type' => 'text/html' }

  def call(env)
    case env['REQUEST_PATH']
    when '/'
      template = File.read('./views/index.erb')
      content = ERB.new(template)
      ['200', CONTENT_TYPE, [content.result]]
    when '/advice'
      ['200', CONTENT_TYPE, [generate_html(Advice.new.generate, ["b", "em"])]]
    else
      ['404', { 'Content-Type' => 'text/html', 'Content-Length' => '211' },
        [generate_html('404 Not Found', ["h4"])]
      ]
    end
  end

  private

  def generate_html(str="Hello World!", elements=["h2"])
    fragment = generate_html_fragment(str, elements)
    html = <<~HTML
    <!DOCTYPE html>
    <html>
      <head>
        <title>Second Rack Application</title>
        <meta charset="utf-8">
      </head>
      <body>
        <h1>Body of Second Rack Application</h1>
        #{fragment}
      </body>
    </html>
    HTML
  end

  def generate_html_fragment(str, elements)
    fragment = ''
    elements.each do |elem|
      fragment << '<' << elem << '>'
    end

    fragment << str

    elements.reverse.each do |elem|
      fragment << '</' << elem << '>'
    end

    fragment
  end
end
