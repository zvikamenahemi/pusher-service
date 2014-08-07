module Extensions
  class Distributor

    def initialize
      puts ">>>>>> initialize"
      @ids = [1, 74]
    end
    
    def incoming(message, callback)
      puts ">>>>>> incoming"
      puts ">>>>>> message: #{message.inspect}"

      if message['channel'] == '/updates'
        @ids.each do |id|
          puts ">>>>>> id: #{id}"
          faye_client = Faye::Client.new('http://localhost:9292/faye')
          faye_client.publish("/updates/#{id}", message['data'])
        end
      end
      callback.call(message)
    rescue Exception => e
      puts ">>>>>> Exception: #{e.message}"
    end

    def outgoing(message, callback)
      puts ">>>>>> outgoing"
      puts ">>>>>> message: #{message.inspect}"
      callback.call(message)
    end
  end
end