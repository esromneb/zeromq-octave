zeromq-octave (zeromq-matlab)
=============

ZeroMQ mex bindings for GNU Octave.  This is a slammed together port from https://github.com/smcgill3/zeromq-matlab.  This version is known to work with ZeroMQ 4.0.4 on Ubuntu 14.04 LTS with Octave 3.8.1.

Requires ZeroMQ to be installed first (see below)

To build, run "make"

To test, run "make test".

To install, copy __zmq.mex__ to your Octave working directory. (there is probably a better way)

Usage Notes
=====
With TCP, this original version of this library assumes that PUB sockets bind to a port, and that SUB sockets connect to a port.  Fear not I have added a publish type that connects to a socket.

### Publish example
To bind to a port and use a publish type socket:
```matlab
% socket is bound here
zsock = zmq('publish','tcp',4000);
while 1
    zmq('send',zsock,'hello world')
    sleep(1)
end
```

### Subscribe example
To connect to a ip/port with a subscribe type socket.  Note that the library will always subscribe to all messages (the same as `zmq_setsockopt(sck, ZMQ_SUBSCRIBE, "", 0 );`)
```matlab
zsock = zmq('subscribe','tcp','127.0.0.1',4000);

while 1
    idx = zmq('poll', 1000);
    [recv_data,has_more] = zmq( 'receive', idx );
    disp( 'tcp receiving...' );
    recv_data2 = char(recv_data');
    disp( recv_data2 );
    sleep(1)
end
```

### Publish connect example
To connect to a port and use a publish type socket:
```matlab
zsock = zmq('publish_connect','tcp','127.0.0.1',4000);

while 1
    zmq('send',zsock,'hello world')
    sleep(1)
end
```


Installing ZeroMQ 3.2.2 on Ubuntu 12.04
=======================
Download the tarball from http://www.zeromq.org/intro:get-the-software
In the root of the extracted archive, run the following commands:

1. ./configure
2. make
3. sudo make install
4. sudo ldconfig
