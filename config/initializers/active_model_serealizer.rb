require "active_model_serializers/register_jsonapi_renderer"

ActiveModel::Serializer.configure do |config|
  config.adapter = :json_api
end
