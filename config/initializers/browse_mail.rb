include BrowseMail

Rails.application.config.to_prepare do
  BrowseMail.preview_classes ||= BrowseMail.find_preview_classes 'app/mailer_previews'
  BrowseMail.encrypt_url_params ||= Rails.env.production?
end
