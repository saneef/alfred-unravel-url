#!/usr/bin/env ruby

require 'uri'

query = ARGV[0]

def url?(str)
	str =~ /\A#{URI::regexp(['http', 'https'])}\z/
end


if url?(query)
	puts true
else
	puts false
end
