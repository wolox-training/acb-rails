OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.secrets.google_client_id ,Rails.application.secrets.google_client_secret, {
  scope: 'userinfo.email, userinfo.profile, plus.me',
  include_granted_scopes: true,
  callback_path: '/auth/google_oauth2/callback'
  }
end
