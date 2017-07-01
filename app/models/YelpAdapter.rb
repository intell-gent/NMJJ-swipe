require 'uri'
require 'net/http'
require 'openssl'
require 'json'
class YelpAdapter

  def initialize
    @api_key = "temp"
  end

  def place_search(city, district, offset = 0)
    url = URI("https://api.yelp.com/v3/businesses/search?location=#{city}+#{district}&limit=50&offset=#{offset}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    request["authorization"] = "Bearer #{@api_key}"
    request["cache-control"] = 'no-cache'
    request["postman-token"] = 'eb3fb1cf-465a-093a-e6e1-fd8cade51817'
    response = http.request(request)
    @data_set = response.read_body
  end

  def data_set
    @data_set
  end

  # def save_data(index)
  #   data = JSON.parse(@data_set[index])
  #   data["name"]
  #   data["image_url"]
  #   data["url"]
  # end

end
