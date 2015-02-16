module Slackdraft

  class Format

    fattr :service
    fattr :type
    fattr :alert
    fattr header: nil
    fattr severity: nil
    fattr runbook: nil
    fattr bot: "slackdraft"
    fattr botlink: nil
    #fattr message: nil

    class Alert < Slackdraft::Attachment
      def send!
        parse
        super
      end

      # Parse the alert message
      def parse
        @title = @service
        
        unless @header.nil?
          @text = @header
        end

        @message = @alert
        @fallback = @alert

        unless @bot.nil?
          @author_name = @bot
          unless @botlink.nil?
            @author_name = @botlink
          end
        end

        unless @severity.nil?
          add_field("Severity", @severity)
        end

        unless @runbook.nil?
          add_field("Runbook", @runbook)
        end
      end

      # Set the alert text
      def service=(service)
        @service = service
      end      
      def service(service)
        @service = service
      end
      alias_method :system=, :service=
      alias_method :system, :service

      
      # Set the alert text
      def bot=(bot)
        @bot = bot
      end      
      def bot(bot)
        @bot = bot
      end
      alias_method :alerter=, :bot=
      alias_method :alerter, :bot
      
      # Set the alert text
      def botlink=(botlink)
        @botlink = botlink
      end      
      def botlink(botlink)
        @botlink = botlink
      end
      alias_method :alerterlink=, :botlink=
      alias_method :alerterlink, :botlink

      # Set the alert text
      def type=(type)
        @type = type
      end      
      def type(type)
        @type = type
      end

      # Set the alert text
      def alert=(alert)
        @alert = alert
      end
      def alert(alert)
        @alert = alert
      end

      # Set the alert text
      def header=(header)
        @header = header
      end
      def alert(header)
        @header = header
      end

      # Set the severity
      def sev=(severity)
        @severity = severity
      end
      def sev(severity)
        @severity = severity
      end
      alias_method :severity, :sev
      alias_method :severity=, :sev=

      # Set the severity
      def runbook=(runbook)
        @runbook = runbook
      end
      def runbook(runbook)
        @runbook = runbook
      end
      alias_method :fix_url, :runbook

    end

  end

end