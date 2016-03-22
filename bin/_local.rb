if ARGV.first == 's' || ARGV.first == 'server'
  require 'rails/commands/server'
  module Rails
    class Server
     def default_options
        super.merge(Host:  '10.0.2.15', Port: 3000)
      end
    end
  end
end