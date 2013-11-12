if Rails.env.development? || Rails.env.test?
	LINKEDIN_API_KEY = "qm9p1viz2gq7"
	LINKEDIN_API_SEC = "1gQqsRmpOF66ZPDl"
elsif Rails.env.production?
	LINKEDIN_API_KEY = "39g8fpt8sm78"
	LINKEDIN_API_SEC = "JNInCtYk4SpJs42u"
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, LINKEDIN_API_KEY, LINKEDIN_API_SEC
end

LinkedIn.configure do |config|
  config.token = LINKEDIN_API_KEY
  config.secret = LINKEDIN_API_SEC
end