module BrowseMail
  class ApplicationController < ::ApplicationController
    def index
      mailer_data  = request.path_info.split("/")
      class_name   = mailer_data[1]
      method_name  = mailer_data[2]
      class_object = Object.const_get(class_name.camelcase)
      values = class_object.instance_method(method_name.to_sym).parameters.map(&:last).map(&:to_s).map do |p|
        params[p]
      end

      message = class_object.send(method_name.to_sym, *values)
      render text: message.body
    end
  end
end
