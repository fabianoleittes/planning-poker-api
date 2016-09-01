require "rails_helper"

describe "Stories API", type: :request do
  let(:backlog) { create(:backlog) }
  let(:story)   { create(:story, backlog: backlog) }

  describe "POST /v1/backlogs/:id/stories" do
    context "with valid data" do
      it "create a story" do

        post "/v1/backlogs/#{backlog.id}/stories", params: story.to_json, headers: json_request_headers

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq("application/json")

        expect(Story.first.description).to eq(story.description)
      end
    end

    context "with invalid data" do
      it "returns error code" do
        story_params = {
          story: {
            description: "",
            backlog_id: nil
          }
        }.to_json

        post "/v1/backlogs/#{backlog.id}/stories", params: story_params, headers: json_request_headers

        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT /v1/backlogs/:id/stories/:id" do
    context "with valid data" do
      it "updates the specified story" do

        put(
          "/v1/backlogs/#{backlog.id}/stories/#{story.id}",
          params: story.to_json,
          headers: json_request_headers
        )

        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(:ok)


        expect(response).to match_response_schema("stories")
      end
    end

    context "with invalid data" do
      it "returns error code" do
        story_params = {
          story: {
            description: "",
            backlog_id: nil
          }
        }.to_json

        put(
          "/v1/backlogs/#{backlog.id}/stories/#{story.id}",
          params: story_params,
          headers: json_request_headers
        )

        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /v1/backlogs/:id/stories/:id" do

    it "deletes the specified story" do
      delete "/v1/backlogs/#{backlog.id}/stories/#{story.id}"

      expect(response).to have_http_status(:no_content)
      expect(Story.count).to eq(0)
    end
  end
end
