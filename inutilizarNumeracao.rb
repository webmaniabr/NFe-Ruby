=begin
JSON request:

{
  "sequencia": "101-109",
  "motivo": "Inutilização por problemas técnicos.",
  "ambiente": "1",
  "serie": "99",
  "modelo": "1"
}
=end

require 'uri'
require 'net/http'

url = URI("https://webmaniabr.com/api/1/nfe/inutilizar/")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Put.new(url)
request["cache-control"] = 'no-cache'
request["content-type"] = 'application/json'
request["x-consumer-key"] = 'SEU_CONSUMER_KEY'
request["x-consumer-secret"] = 'SEU_CONSUMER_SECRET'
request["x-access-token"] = 'SEU_ACCESS_TOKEN'
request["x-access-token-secret"] = 'SEU_ACCESS_TOKEN_SECRET'
request.body = "{\"sequencia\":\"101-109\",\"motivo\":\"Inutilização por problemas técnicos.\",\"ambiente\":\"1\",\"serie\":\"99\",\"modelo\":\"1\"}"

response = http.request(request)
puts response.read_body
