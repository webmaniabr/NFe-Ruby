require 'uri'
require 'net/http'

url = URI("https://webmaniabr.com/api/1/nfe/inutilizar/")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Put.new(url)
request["cache-control"] = 'no-cache'
request["content-type"] = 'application/json'
request["x-consumer-key"] = 'SEU_CONSUMER_KEY'
request["x-consumer-secret"] = 'SEU_CONSUMER_SECRET'
request["x-access-token"] = 'SEU_ACCESS_TOKEN'
request["x-access-token-secret"] = 'SEU_ACCESS_TOKEN_SECRET'

request.body = "{\n\t\"sequencia\":\"101-109\",\n\t\"motivo\":\"Inutilização por problemas técnicos.\",\n\t\"ambiente\":\"2\",\n\t\"serie\":\"99\",\n\t\"modelo\":\"1\"\n}"

response = http.request(request)
puts response.read_body