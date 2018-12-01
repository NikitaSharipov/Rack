class TimeFormat

  TIME_FORMAT = {'year' => '%Y', 'month' => '%m', 'day' => '%d', 'hour' => '%H', 'minute' => '%M', 'second' => '%S'}

  def initialize(formats)
    @formats = formats.split(',')
  end

  def valid?
    invalid_keys.empty?
  end

  def invalid_keys
    @formats.select do |format|
      TIME_FORMAT.key?(format)
    end
  end

  def valid_keys_value
    time_format = []
    @formats.map do |format|
      time_format.push(TIME_FORMAT[format])
    end
    time_format
  end

  def valid_output
    Time.now.strftime(valid_keys_value.join('-'))
  end

end
