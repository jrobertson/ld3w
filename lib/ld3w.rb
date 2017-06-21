#!/usr/bin/env ruby

# file: ld3w.rb


require 'nmea_parser'

class Ld3w


  def initialize(device: '', bdaddress: 'rfcomm0', channel: '1', affirmations: 5)

    @command = "rfcomm connect %s %s %s" % [device, bdaddress, channel]
    @file = '/dev/' + device
    @np = NMEAParser.new
    @affirmations = affirmations

  end
  
  def locate()

    line = ''

    t = Time.now

    IO.popen @command do |io|

      while not File.exists? @file
        sleep 1
        puts 'waiting ...'
      end

      # get the data from the file

      pattern = /^\$GPGGA/
      line_count = 0

      IO.foreach(@file) do |x| 

        print "GOT ", x
        c = x.split(',').count('')

        if x =~ pattern and c <= 2 then
          line = x 
          line_count > @affirmations ? break : line_count += 1
        end
      end

      puts 'bye'
      Process.kill('KILL', io.pid)

    end

    @np.parse(line)
    @np


  end

end

