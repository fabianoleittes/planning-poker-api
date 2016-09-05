ActiveSupport.on_load(:action_controller) do
  require 'active_model_serializers/register_jsonapi_renderer'
end

ActiveModel::Serializer.configure do |config|
  config.adapter        = :json_api
  config.key_transform  = :underscore
end
