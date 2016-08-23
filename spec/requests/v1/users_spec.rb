require "rails_helper"

describe "Users API", type: :request do

  describe "POST /v1/users" do
    context "with valid data" do
      it "create a user" do

        user_params = {
          user: {
            full_name: "Fabiano Leite",
            email: "fabianoleite@gmail.com",
            kind: "PO"
          }
        }.to_json

        post "/v1/users", params: user_params, headers: json_request_headers

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq("application/json")

        expect(response).to match_response_schema("users")
      end
    end

    context "with invalid data" do
      it "returns error code" do

        user_params = {
          user: {
            full_name: "",
            email: "",
            kind: ""
          }
        }.to_json

        post "/v1/users", params: user_params, headers: json_request_headers

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end
end
