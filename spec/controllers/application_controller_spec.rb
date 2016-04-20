require "spec_helper"

describe BrowseMail::ApplicationController do
  routes { BrowseMail::Engine.routes }

  context "GET marketing_mailer_preview.daily_mail" do
    it "renders the email with the parameters passed" do
      controller.request.path_info = "/marketing_mailer_preview.daily_mail"
      get :index, id: "some_id"

      expect(response.body).to match(/some_id/)
    end
  end
end
