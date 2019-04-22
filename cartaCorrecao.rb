require 'uri'
require 'net/http'

url = URI("https://webmaniabr.com/api/1/nfe/cartacorrecao/")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["cache-control"] = 'no-cache'
request["content-type"] = 'application/json'
request["x-consumer-key"] = 'SEU_CONSUMER_KEY'
request["x-consumer-secret"] = 'SEU_CONSUMER_SECRET'
request["x-access-token"] = 'SEU_ACCESS_TOKEN'
request["x-access-token-secret"] = 'SEU_ACCESS_TOKEN_SECRET'

request.body = "{\n\t\"chave\": \"00000000000000000000000000000000000000000000\",\n\t\"correcao\": \"O CFOP correto é 5.102 referente a revenda tributada no mesmo estado.\"\n}"

response = http.request(request)
puts response.read_body