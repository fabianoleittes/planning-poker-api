require "rails_helper"

describe "Backlogs API", type: :request do
  let(:user)    { create(:user) }
  let(:backlog) { create(:backlog, user: user) }

  describe "GET /v1/backlogs" do
    before do
      create_list(:backlog, 5, user: user)
      get "/v1/backlogs", headers: json_request_headers
    end

    it "responds with 200" do
      expect(response).to have_http_status(:ok)
    end

    it "returns content_type" do
      expect(response.content_type).to eq("application/json")
    end

    it "returns all the backlogs" do
      expect(response).to match_response_schema("backlogs")
      expect(Backlog.count).to eq(5)
    end
  end

  describe "GET /v1/backlogs/:id" do

    before { get "/v1/backlogs/#{backlog.id}", headers: json_request_headers }

    it "returns a requested backlog" do
      expect(response).to match_response_schema("backlogs")
    end

    it "responds with 200" do
      expect(response).to have_http_status(:ok)
    end

    it "returns content_type" do
      expect(response.content_type).to eq("application/json")
    end
  end

  describe "POST /v1/backlogs" do
    context "with valid data" do
      it "create a backlog" do

        post(
          "/v1/backlogs",
          params: backlog.to_json,
          headers: json_request_headers
        )

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq("application/json")
        expect(Backlog.first.name).to eq(backlog.name)

      end
    end

    context "with invalid data" do
      it "returns error code" do
        backlog_params = {
          backlog: { name: ""}
        }.to_json

        post(
          "/v1/backlogs",
          params: backlog_params,
          headers: json_request_headers
        )

        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT /v1/backlogs/:id" do
    context "with valid date" do
      it "updates the specified backlog" do

        backlog_params = {
          backlog: { name: "marketing"}
        }.to_json

        put(
          "/v1/backlogs/#{backlog.id}",
          params: backlog_params,
          headers: json_request_headers
        )

        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(:ok)

        expect(response).to match_response_schema("backlogs")
      end
    end

    context "with invalid data" do
      it "returns error code" do
        backlog_params = {
          backlog: { name: ""}
        }.to_json

        put(
          "/v1/backlogs/#{backlog.id}",
          params: backlog_params,
          headers: json_request_headers
        )

        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /backlogs/:id" do
    it "deletes the specified backlog" do
      delete "/v1/backlogs/#{backlog.id}"

      expect(response).to have_http_status(:no_content)
    end
  end
end
