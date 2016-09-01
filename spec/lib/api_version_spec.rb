require "rails_helper"

describe ApiVersion do
  let(:api_version_v1) { ApiVersion.new(version: "v1", default: true) }
  let(:api_version_v2) { ApiVersion.new(version: "v2") }

  describe "matches?" do

    it "returns the default version when 'default' true is specified" do
      request = double(host: "http://api.planning-poker.dev",
                       headers: { "Accept" => "application/vnd.planning-poker.v1" })

      expect(api_version_v1.matches?(request)).to be_truthy
    end

    it "returns true when the version matches the 'Accept' header" do
      request = double(host: "http://api.planning-poker.dev",
                       headers: { "Accept" => "application/vnd.planning-poker.v2+json" })

      expect(api_version_v2.matches?(request)).to be_truthy
    end
  end
end
