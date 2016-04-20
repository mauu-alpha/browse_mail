module BrowseMailer
  class MarketingMailer < ActionMailer::Base
    default from: '"BrowseMail Enterprise" <marketing@browse_mail.com>', content_type: 'text/html'

    layout "mailer"

    def daily_mail(id)
      @id = id
      mail(to: "bi_marketing@browse_mail.com", subject: "Daily statistics")
    end
  end
end
