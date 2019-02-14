require_relative 'advice'

class HelloWorldFourth
  CONTENT_TYPE = { 'Content-Type' => 'text/html' }

  def call(env)
    case env['REQUEST_PATH']
    when '/'
      [
        '200', CONTENT_TYPE, [erb(:index)]
      ]
    when '/advice'
      [
        '200', CONTENT_TYPE, [erb(:advice, { message: Advice.new.generate })]
      ]
    else
      [
        '404', { 'Content-Type' => 'text/html', 'Content-Length' => '292' },
        [erb(:not_found)]
      ]
    end
  end

  private

  def erb(filename, local={})
    b = binding
    message = local[:message]
    template = File.read("./views/#{filename}.erb")
    ERB.new(template).result(b)
  end

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
