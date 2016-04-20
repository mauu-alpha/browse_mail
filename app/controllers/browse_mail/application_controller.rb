module BrowseMail
  class ApplicationController < ::ApplicationController
    before_filter :decrypt_url_params

    def index
      render text: retrieve_mail.body
    end

    private

    def retrieve_mail
      class_name, method_name = request.path_info.split('/')[1].split('.')
      class_object = Object.const_get(class_name.camelcase)
      initialize_class(class_object).send(method_name.to_sym)
    end

    def initialize_class(class_object)
      object_instance = class_object.new
      params.except(:action, :controller).each do |key, value|
        object_instance.instance_variable_set "@#{key}".to_sym, value
      end

      object_instance
    end

    def decrypt_url_params
      return unless BrowseMail.encrypted_url_params? && params[:p].present?

      encrypted_url_params = params.delete(:p)
      decrypted_url_params = BrowseMail::Crypto.decrypt encrypted_url_params
      params.merge! Rack::Utils.parse_nested_query(decrypted_url_params)
    end
  end
end
