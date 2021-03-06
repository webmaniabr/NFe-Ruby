=begin
JSON request:

{
  "chave": "45150819652219000198550990000000011442380343",
  "natureza_operacao": "Devolução de venda de produção do estabelecimento",
  "codigo_cfop": "1.202",
  "produtos": [ 2, 3 ],
  "ambiente": "1"
}
=end

require 'uri'
require 'net/http'

url = URI("https://webmaniabr.com/api/1/nfe/devolucao/")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["cache-control"] = 'no-cache'
request["content-type"] = 'application/json'
request["x-consumer-key"] = 'SEU_CONSUMER_KEY'
request["x-consumer-secret"] = 'SEU_CONSUMER_SECRET'
request["x-access-token"] = 'SEU_ACCESS_TOKEN'
request["x-access-token-secret"] = 'SEU_ACCESS_TOKEN_SECRET'
request.body = "{\"chave\":\"45150819652219000198550990000000011442380343\",\"natureza_operacao\":\"Devolução de venda de produção do estabelecimento\",\"codigo_cfop\":\"1.202\",\"produtos\": [ 2, 3 ],\"ambiente\":\"1\"}"

response = http.request(request)
puts response.read_body
