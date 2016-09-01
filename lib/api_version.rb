class ApiVersion
  def initialize(version:, default: false)
    @version, @default = version, default
  end

  def matches?(request)
    @default || check_headers(request.headers)
  end

  private

  def check_headers(headers)
    accept = headers["Accept"]
    accept && accept.include?(media_type)
  end

  def media_type
    "application/vnd.planning-poker.#{@version}+json"
  end
end
