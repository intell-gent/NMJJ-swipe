require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'dotenv/load'
class YelpAdapter

  def initialize
    @api_key = ENV["API_KEY"]
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
url = URI("https://api.yelp.com/v3/businesses/search?location=san%20francisco%20mission&limit=50")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["authorization"] = 'Bearer McwIrwfqu5KJ-We7CDn818aXKIKAiBUbdu246TCrNmRfzHA_RfjV0u4ENHh3MzPnlJzIl5FhYiFcxP1R1Y36D3tOVRlhc8GWgW3cn_tTxEM5lURtUJlQ59TzXZpWWXYx'
request["cache-control"] = 'no-cache'
request["postman-token"] = 'cca45bfd-6f54-e094-a68d-c92f4af577c2'

response = http.request(request)
puts response.read_body
