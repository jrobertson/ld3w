Gem::Specification.new do |s|
  s.name = 'ld3w'
  s.version = '0.2.2'
  s.summary = 'Reads the GPS data from a Nokia LD-3W GPS bluetooth receiver ' + 
      'using the system command rfcomm.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/ld3w.rb']
  s.add_runtime_dependency('nmea_parser', '~> 0.3', '>=0.3.4')
  s.add_runtime_dependency('c32', '~> 0.1', '>=0.1.2')
  s.signing_key = '../privatekeys/ld3w.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/ld3w'
end
