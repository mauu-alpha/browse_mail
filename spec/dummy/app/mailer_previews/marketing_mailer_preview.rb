class MarketingMailerPreview
  def daily_mail
    BrowseMailer::MarketingMailer.daily_mail(@id)
  end

  def weekly_mail
  end
end
