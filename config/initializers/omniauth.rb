LINKEDIN_API_KEY = "qm9p1viz2gq7"
LINKEDIN_API_SEC = "1gQqsRmpOF66ZPDl"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, LINKEDIN_API_KEY, LINKEDIN_API_SEC
end

LinkedIn.configure do |config|
  config.token = LINKEDIN_API_KEY
  config.secret = LINKEDIN_API_SEC
end