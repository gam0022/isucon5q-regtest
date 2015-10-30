# -*- encoding: utf-8 -*-
require 'httpclient'
require 'pp'

def logs(response)
  h = response.http_header

  request = "#{h.request_method} #{h.request_uri.request_uri} HTTP/#{h.http_version}"
  puts request
  puts
  puts response.body
  puts
  puts

  return request
end

def bench()
  start = Time.now
  request = logs(yield)
  stop = Time.now
  STDERR.puts request
  STDERR.puts "#{stop - start}[s]"
  STDERR.puts
end

base_url = 'http://130.211.250.13'

client1 = HTTPClient.new
bench { client1.get(base_url + '/initialize') }
bench { client1.get(base_url + '/') }
bench { client1.post(base_url + '/login', password: 'eladio4996', email: 'eladio4996@isucon.net') }
bench { client1.get(base_url + '/') }
bench { client1.get(base_url + '/diary/comment/947') }
bench { client1.get(base_url + '/friends') }

client2 = HTTPClient.new
bench { client1.post(base_url + '/login', password: 'armand875', email: 'armand875@isucon.net') }
bench { client1.get(base_url + '/footprints') }
