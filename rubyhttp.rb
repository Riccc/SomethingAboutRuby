require "open-uri"
uri = "http://www.baidu.com"
html_response = nil 
open(uri) do |http|  
html_response = http.read  
end 
puts html_response  