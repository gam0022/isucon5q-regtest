# -*- encoding: utf-8 -*-
require 'httpclient'
require 'pp'

def logs(response)
  h = response.http_header

  puts "#{h.request_method} #{h.request_uri.request_uri} HTTP/#{h.http_version}"
  puts
  puts response.body
  puts
  puts
end

base_url = 'http://130.211.250.13'

client1 = HTTPClient.new
logs client1.get(base_url + '/initialize')
logs client1.get(base_url + '/')
logs client1.post(base_url + '/login', {password: 'eladio4996', email: 'eladio4996@isucon.net'})
logs client1.get(base_url + '/')
logs client1.get(base_url + '/diary/comment/947')
logs client1.get(base_url + '/friends')

client2 = HTTPClient.new
logs client1.post(base_url + '/login', {password: 'armand875', email: 'armand875@isucon.net'})
logs client1.get(base_url + '/footprints')
