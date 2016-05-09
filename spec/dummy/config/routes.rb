Rails.application.routes.draw do
  mount BrowseMail::Engine => "/browse_mail"
end
