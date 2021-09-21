ActionMailer::Base.add_delivery_method :ses,
                                       AWS::SES::Base,
                                       access_key_id: Rails.application.credentials.AWS_ACCESS_KEY,
                                       secret_access_key: Rails.application.credentials.AWS_SECRET_KEY,
                                       server: 'email.ap-northeast-1.amazonaws.com'