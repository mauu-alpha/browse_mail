Rails.application.config.to_prepare do
  BrowseMail.preview_classes_path = 'spec/dummy/app/mailer_previews'
end
