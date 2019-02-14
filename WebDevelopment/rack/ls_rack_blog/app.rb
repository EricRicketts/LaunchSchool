require_relative 'advice'
require_relative 'monroe'

class App < Monroe
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
end
