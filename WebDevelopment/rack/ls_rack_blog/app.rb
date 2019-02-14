require_relative 'advice'

class App
  CONTENT_TYPE = { 'Content-Type' => 'text/html' }

  def call(env)
    case env['REQUEST_PATH']
    when '/'
      status = '200'
      headers = CONTENT_TYPE
      response(status, headers) do
        erb(:index)
      end
    when '/advice'
      status = '200'
      headers = CONTENT_TYPE
      response(status, headers) do
        erb(:advice, { message: Advice.new.generate })
      end
    else
      status = '404'
      headers = { 'Content-Type' => 'text/html', 'Content-Length' => '292' }
      response(status, headers) do
        erb(:not_found)
      end
    end
  end

  private

  def erb(filename, local={})
    b = binding
    message = local[:message]
    template = File.read("./views/#{filename}.erb")
    ERB.new(template).result(b)
  end

  def response(status, headers, body='')
    body = yield if block_given?
    [status, headers, [body]]
  end
end
