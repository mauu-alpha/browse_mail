mailers = Dir[Rails.root + 'app/mailers/**/*.rb'].map { |p| File.basename(p, '.rb') }

BrowseMail::Engine.routes.draw do
  mailers.each do |mailer|
    scope "/#{mailer}" do
      Object.const_get(mailer.camelcase).instance_methods(false).each do |method|
        puts "route #{mailer}\##{method}"
        get method.to_s => 'application#index'
      end
    end
  end
end
