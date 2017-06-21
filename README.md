# Introducing the ld3w gem

    require 'ld3w'

    ld3w = Ld3w.new device: 'rfcomm0', bdaddress: '00:02:76:C9:60:28', channel: '1'
    loc = ld3w.locate

    puts "http://www.latlong.net/c/?lat=%s&long=%s" % [loc.latitude, loc.longitude]

<pre>
=&gt; #&lt;NMEAParser:0x75c2d0 @longitude=-3.137085, @latitude=55.91921167,
 @time=2017-06-21 19:43:14 +0100, @quality="1", @num_sat="04", @hdop="4.3",
 @altitude="120.2", @alt_unit="M", @height_geoid="49.5",
 @height_geoid_unit="M", @last_dgps="", @dgps="0000"&gt;
</pre>

    puts "http://www.latlong.net/c/?lat=%s&long=%s" % [loc.latitude, loc.longitude]
    #=> http://www.latlong.net/c/?lat=55.91921167&long=-3.137085

Notes:

To set up the device rfcomm0 follow the instructions from ?Connecting the Raspberry PI to a Nokia LD-3W through Bluetooth http://www.jamesrobertson.eu/blog/2014/jun/21/connecting-the-raspberry-pi-to-a-nokia-ld.html?. The only amenedment to the previous instruction is that pairing should be done using the `bluetoothctl` command followed by the `agent on` command and then `pair [bdaddress]` where the bdaddress in square brackets should specify the actual bluetooth device address.

## Resources

* Introducing the NMEA parser gem http://www.jamesrobertson.eu/snippets/2014/jul/05/introducing-the-nmea-parser-gem.html
* Connecting to a Nokia LD-3W #bluetooth #gps https://www.jamesrobertson.eu/liveblog/2017/jun/21/#gps
* ld3w https://rubygems.org/gems/ld3w

gps nmea gem bluetooth ld3w
