OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '578697105525387', '817e83a11556f207bd658788a69c59b9'
end