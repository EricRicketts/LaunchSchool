require_relative 'advice'

class HelloWorldSecond
  CONTENT_TYPE = { 'Content-Type' => 'text/html' }

  def call(env)
    case env['REQUEST_PATH']
    when '/'
      ['200', CONTENT_TYPE, [generate_html]]
    when '/advice'
      ['200', CONTENT_TYPE, [generate_html(Advice.new.generate)]]
    else
      ['404', { 'Content-Type' => 'text/html', 'Content-Length' => '209' },
        [generate_html('404 Not Found')]
      ]
    end
  end

  private

  def generate_html(str="Hello World!")
    html = <<~HTML
    <!DOCTYPE html>
    <html>
      <head>
        <title>Second Rack Application</title>
        <meta charset="utf-8">
      </head>
      <body>
        <h3>Body of Second Rack Application</h3>
        <p>#{str}</p>
      </body>
    </html>
    HTML
  end
end
