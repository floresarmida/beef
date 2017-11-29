#
# Copyright (c) 2006-2017 Wade Alcorn - wade@bindshell.net
# Browser Exploitation Framework (BeEF) - http://beefproject.com
# See the file 'doc/COPYING' for copying permission
#
require 'pry-byebug'
require 'rest-client'
require 'json'
require 'optparse'
require 'pp'

require '../common/test_constants'
require './lib/beef_rest_client'

passwds = (1..9).map { |i| "broken_pass"}
passwds.push BEEF_PASSWD
apis = passwds.map { |pswd| BeefRestClient.new('http', ATTACK_DOMAIN, '3000', BEEF_USER, pswd) }

#binding.pry
t0 = Time.now().usec
l = apis.length
(0..50).each do |i|
  t = Time.now().usec
  puts "#{i} : #{t - t0} : #{apis[i%l].auth()[:payload]}"
  t0 = t
end


#binding.pry
#         response = @api.auth

#@api.version if response[:success]
