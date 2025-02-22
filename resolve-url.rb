#!/usr/bin/env ruby

require 'uri'
require 'net/http'
require 'json'

query = ARGV[0]

error_code = "UNRAVEL_URL_ERROR"
$unravel_url_base_uri = "https://unravelurl.com/api/resolve.json" # https://unravelurl.com/api/resolve.json?url=https://saneef.me

def parse_response(data)
	json_string = JSON.parse(data)

	json_string
end

def resolve_url(url)
	uri = URI($unravel_url_base_uri)
	params = {:url => url}
	uri.query  = URI.encode_www_form(params)

	res = Net::HTTP::get_response(uri)
	parse_response(res.body)
end

resolved_url = resolve_url(query)

if resolved_url["status"] == "ok"
	print resolved_url["target"]
else
	print error_code
end
