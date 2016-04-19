module BrowseMail
  module BrowseMailHelper
    def online_mail_version_url(params = {})
      "#{class_as_prefix}.#{action_as_sufix}#{params_as_qs(params)}"
    end

    def params_as_qs(params = {})
      return unless params.keys.any?

      if BrowseMail.encrypted_url_params?
        "?p=#{BrowseMail::Crypto.encrypt(params.to_query)}"
      else
        "?#{params.to_query}"
      end
    end

    def class_as_prefix
      controller.class.name.underscore + '_preview'
    end

    def action_as_sufix
      controller.action_name
    end
  end
end
