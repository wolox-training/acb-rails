redis_config = {
  url: Rails.application.secrets.redis_url,
  password: Rails.application.secrets.redis_password,
  namespace: Rails.application.secrets.redis_namespace
}

Sidekiq.configure_server do |config|
  config.redis = redis_config
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end
