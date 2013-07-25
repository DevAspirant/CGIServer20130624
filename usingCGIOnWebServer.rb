# take a require 
require 'webrick'
include WEBrick 

module WEBrick::HTTPServlet 
       FileHandler.add_handler('rb',CGIHandler)
end
s = HTTPServer.new(:Port => 12345 ,
                   :DocumentRoot   => File.join(Dir::pwd, "public_html"),
                   :CGIInterpreter => "/usr/bin/ruby")
trap('INT'){s.shutdown}
s.start 
