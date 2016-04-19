require "spec_helper"

describe BrowseMail::ApplicationController do
  routes { BrowseMail::Engine.routes }

  context "for preview classes namespaced" do
    it "defines routes based on the class and its methods names" do
      handler = { controller: "browse_mail/application", action: "index" }

      expect(get: "marketing_mailer_preview.daily_mail").to route_to(handler)
      expect(get: "marketing_mailer_preview.weekly_mail").to route_to(handler)
    end
  end

  context "for preview classes without namespace" do
    it "defines routes based on the class and its methods names" do
      handler = { controller: "browse_mail/application", action: "index" }

      expect(get: "internal/metrics_report_mailer_preview.marketing_metrics").to route_to(handler)
      expect(get: "internal/metrics_report_mailer_preview.application_status").to route_to(handler)
    end
  end

  context "when the suffix preview is not provided" do
    it "does not defines routes based on the class and its methods names" do
      expect(get: "unreachable_mailer.statistics").not_to be_routable
    end
  end
end
