#!/usr/bin/env ruby

# file: ld3w.rb


require 'nmea_parser'


class Ld3wError < Exception
end

class Ld3w


  def initialize(device: '', bdaddress: 'rfcomm0', channel: '1', affirmations: 5)

    @command = "rfcomm connect %s %s %s" % [device, bdaddress, channel]
    @file = '/dev/' + device
    @np = NMEAParser.new
    @affirmations = affirmations
    @device = device

  end
  
  def locate()

    line = ''
    lines = []
    
    IO.popen @command, autoclose: true do |io|
      
      sleep 2
      t = Time.now
      
      (sleep 1; puts 'waiting ...') until File.exists?(@file) or 
          Time.now > (t + 10)
      
      raise(Ld3wError, 'Cannot open file ' + @file) unless File.exists? @file

      # get the data from the file

      pattern = /^\$GPGGA/
      line_count = 0

      IO.foreach(@file) do |x| 

        print "GOT ", x
        c = x.split(',').count('')

        if x =~ pattern and c <= 2 then
          lines << x 
          line_count > @affirmations ? break : line_count += 1
        end
        sleep 0.05
      end
      sleep 2

      puts 'bye'
      Process.kill('INT', io.pid)
      sleep 2
    end
    
    #`rfcomm release #{@device}`

    lines.map {|x| @np.parse(x) }


  end

end
