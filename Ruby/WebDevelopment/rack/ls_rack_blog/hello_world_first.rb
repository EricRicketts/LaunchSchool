class HelloWorldFirst
  def call(env)
    arr = env.map do |k, v|
      "<p>#{k}: #{v}</p>"
    end
    html = "<!DOCTYPE html><html><head><title>Rack Application</title><meta charset=\"utf-8\"></head><body>"
    html << "<h1>Default Rack Environment Variables</h1>"
    arr.each do |par|
      html << par
    end
    html << "</body></html>"
    ['200', { 'Content-Type' => 'text/html' }, [html]]
  end
end
