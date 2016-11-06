Thread.new do
  EventMachine::error_handler { |e| puts "#{e}: #{e.backtrace.first}" }

  EventMachine.run do
    EventMachine::MQTT::ClientConnection.connect(host: ENV['mqqt_host'], clean_session: true) do |c|
      c.subscribe('device/sck/+/readings')
      c.receive_callback do |packet|
        MqttHandler::ReadingsPacket.store(packet)
      end
    end
  end
end
