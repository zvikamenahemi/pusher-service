require 'faye'
load 'extensions/distributor.rb'

faye_server = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
faye_server.add_extension(Extensions::Distributor.new)
run faye_server