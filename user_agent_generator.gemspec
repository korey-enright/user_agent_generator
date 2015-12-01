require 'rake'

Gem::Specification.new do |s|
  s.name        = 'user_agent_generator'
  s.version     = '0.0.1'
  s.executables << 'user_agent_generator'
  s.date        = '2015-12-01'
  s.summary     = "Creates User Agent strings"
  s.description = "A very basic user agent generator for use with the user agent overrider extenstion in firefox"
  s.authors     = ["Korey Enright"]
  s.email       = ["kenright@iit.edu"]
  s.files       = FileList['lib/*',
  	                       'lib/user_agent_generator/*',
                           'bin/*',
                           '[A-Z]*'].to_a
  s.homepage    =
    'https://github.com/korey-enright/user_agent_generator.git'
  s.license     = 'MIT'
end