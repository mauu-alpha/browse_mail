require 'spec_helper'

describe BrowseMail::BrowseMailHelper do
  it "generates a url based on the controller" do
    allow(helper.controller).to receive(:class).and_return(ApplicationController)
    allow(helper.controller).to receive(:action_name).and_return("custom_action_name")

    expect(helper.online_mail_version_url).to eq("application_controller_preview.custom_action_name")
  end
end
