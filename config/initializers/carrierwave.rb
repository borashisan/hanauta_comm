require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'hanauta-comm-bucket' # 作成したバケット名を記述
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.AWS_ACCESS_KEY_ID.to_s, # 環境変数
      aws_secret_access_key: Rails.application.credentials.AWS_SECRET_ACCESS_KEY.to_s, # 環境変数
      region: 'ap-northeast-1',   # アジアパシフィック(東京)を選択した場合
      path_style: true
    }
end 