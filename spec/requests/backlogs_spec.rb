require "rails_helper"

describe "Backlogs API", type: :request do
  describe "GET /v1/backlogs" do

    it "returns all the backlogs" do
      create_list(:backlog, 5)

      get "/v1/backlogs", json_request_headers

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq("application/json")
      expect(Backlog.count).to eq(5)

      body = response_json

      body["data"].map{ |m| m["attributes"]["name"] }
    end
  end

  describe "GET /v1/backlogs/:id" do

    it "returns a requested backlog" do
      backlog =  create(:backlog, name: "dev")

      get "/v1/backlogs/#{backlog.id}", json_request_headers

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq("application/json")

      body = response_json
      backlog_name = body["data"]["attributes"]["name"]

      expect(backlog_name).to eq("dev")
    end
  end

  describe "POST /v1/backlogs" do
    context "with valid data" do
      it "create a backlog" do

        backlog_params = {
          backlog: {
            name: "DEV"
          }
        }.to_json

        post "/v1/backlogs", backlog_params, json_request_headers

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq("application/json")
        expect(Backlog.first.name).to eq("DEV")

      end
    end

    context "with invalid data" do
      it "returns error code" do
        backlog_params = {
          backlog: { name: ""}
        }.to_json

        post "/v1/backlogs", backlog_params, json_request_headers

        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT /v1/backlogs/:id" do
    context "with valid date" do
      it "updates the specified backlog" do
        dev =  create(:backlog, name: "dev")

        backlog_params = {
          backlog: { name: "marketing"}
        }.to_json

        put "/v1/backlogs/#{dev.id}", backlog_params, json_request_headers

        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(:ok)

        body = response_json

        backlog_name = body["data"]["attributes"]["name"]
        expect(backlog_name).to eq("marketing")
      end
    end

    context "with invalid data" do
      it "returns error code" do
        dev =  create(:backlog, name: "dev")

        backlog_params = {
          backlog: { name: ""}
        }.to_json

        put "/v1/backlogs/#{dev.id}", backlog_params, json_request_headers

        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /backlogs/:id" do
    it "deletes the specified backlog" do
      dev =  create(:backlog)

      delete "/v1/backlogs/#{dev.id}"

      expect(response).to have_http_status(:no_content)
    end
  end
end
