module RequestSpecHelper
  # parse json
  def json
    JSON.parse(response.body)
  end
end
