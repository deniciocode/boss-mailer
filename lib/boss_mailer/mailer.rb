module BossMailer
  class Mailer
    def initialize(mail_settings, working_hours)
      @working_hours = working_hours
      @mail_settings = mail_settings
      @mail_settings[:body] = mail_body
      @mailer = Mail.new @mail_settings
    end

    def mail
      @mailer.delivery_method :smtp, address: "localhost", port: 1025
      @mailer.deliver
    end

    private

    def mail_body
      "Start #{@working_hours[:start]}\n\
      Ende #{@working_hours[:end]}\n\
      Pause #{@working_hours[:pause]}"
    end
  end
end
