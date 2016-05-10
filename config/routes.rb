require 'browse_mail/crypto'

mailers = BrowseMail.find_preview_classes(BrowseMail.preview_classes_path)

BrowseMail::Engine.routes.draw do
  mailers.each do |mailer|
    Object.const_get(mailer.camelcase).instance_methods(false).each do |method|
      get "#{mailer.underscore}.#{method}" => 'application#index'
    end
  end
end
