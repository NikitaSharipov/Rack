require_relative 'time_format'
class App

  def call(env)

    request = Rack::Request.new(env)

    if request.get? && request.path == "/time"
      time_format(request)
    else
      output_array(404, "Not Found")
    end
  end

  private

  def time_format(request)
    formater = TimeFormat.new(request.params)
    if formater.valid?
      output_array(200, formater.valid_output)
    else
      output_array(400, "Unknown time format #{formater.invalid_keys}")
    end
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def output_array(code, body)
    [code, headers, [body + "\n"]]
  end

end
