creds = Aws::Credentials.new(Rails.application.credentials.AWS_ACCESS_KEY, Rails.application.credentials.AWS_SECRET_KEY)

Aws::Rails.add_action_mailer_delivery_method(
  :ses,
  credentials: creds,
  region: 'ap-northeast-1' 
)