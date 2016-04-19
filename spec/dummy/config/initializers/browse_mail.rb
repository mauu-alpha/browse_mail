Rails.application.config.to_prepare do
  BrowseMail.preview_classes = BrowseMail.find_preview_classes 'spec/dummy/app/mailer_previews'
end
