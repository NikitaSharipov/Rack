require_relative 'time_format'
class App

  def call(env)

    request = Rack::Request.new(env)

    if request.get? && request.path == "/time"
      time_format(request)
    else
      make_response(404, "Not Found")
    end
  end

  private

  def time_format(request)
    formater = TimeFormat.new(request.params['format'])
    if formater.valid?
      make_response(200, formater.valid_output)
    else
      make_response(400, "Unknown time format #{formater.invalid_keys}")
    end
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def make_response(code, body)
    [code, headers, [body + "\n"]]
  end

end
