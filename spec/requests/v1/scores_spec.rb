require "rails_helper"

describe "Scores API", type: :request do
  let(:user) { create(:user) }
  let(:backlog) { create(:backlog, user: user) }
  let(:story) { create(:story, backlog: backlog) }
  let(:score) { create(:score, user: user, backlog: backlog, story: story) }

  describe "POST /v1/backlogs/:id/stories/:id/scores" do
    context "with valid data" do
      it "create a score" do
        post(
          "/v1/backlogs/#{backlog.id}/stories/#{story.id}/scores",
          params: score.to_json,
          headers: json_request_headers
        )

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq("application/json")

        expect(response).to match_response_schema("scores")
      end
    end

    context "with invalid data" do
      it "returns error code" do
        score_params = {
          score: {
            value: 5,
            user_id: nil,
            backlog_id: nil,
            story_id: nil
          }
        }.to_json

        post(
          "/v1/backlogs/#{backlog.id}/stories/#{story.id}/scores",
          params: score_params,
          headers: json_request_headers
        )

        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
