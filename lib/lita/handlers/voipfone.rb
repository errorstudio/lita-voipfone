module Lita
  module Handlers
    class Voipfone < Handler

      def self.default_config(config)
        config.username = nil
        config.password = nil
      end

      route /^phone\s+divert\s+(.+)/i, :divert, command: true, :help => {
        "phone divert NUMBER" => "Divert phones to NUMBER"
      }

      route /^phone\s+undivert/i, :undivert, command: true, :help => {
        "phone undivert" => "Undivert phones"
      }

      route /(^phone\s+show\s+diverts|^phone\s+diverts)/i, :show_diverts, command: true, :help => {
        "phone show diverts" => "Show current phone diverts",
        "phone diverts" => "Show current phone diverts"
      }

      def divert(response)
        configure_voipfone
        number = response.matches[0][0]
        d = VoipfoneClient::GlobalDivert.new
        d.type = :all
        d.number = number
        if d.save
          response.reply("Divert to #{number} was saved.\n")
          show_diverts(response)
        end
      end

      def undivert(response)
        configure_voipfone
        if VoipfoneClient::GlobalDivert.clear!
          response.reply("All phone diverts have been cleared.\n")
          show_diverts(response)
        end
      end

      def show_diverts(response)
        configure_voipfone
        diverts = VoipfoneClient::GlobalDivert.all
        if diverts.count == 0
          response.reply("There are no phone diverts set")
        else
          lines = ["The following diverts are set:"]
          lines += diverts.collect {|d| "#{d.number}: #{d.type}"}
          response.reply(lines.join("\n"))
        end
      end

      private
      def configure_voipfone
        VoipfoneClient.configure do |c|
          c.username = Lita.config.handlers.voipfone.username
          c.password = Lita.config.handlers.voipfone.password
        end
      end
    end


    Lita.register_handler(Voipfone)
  end
end
