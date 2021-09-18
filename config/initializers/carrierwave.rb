require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'hanauta-comm-bucket' # 作成したバケット名を記述
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIA4HFKPDHMCXXMBUV3', # 環境変数
      aws_secret_access_key: 'wn9tnat8lRVFPQljz2F/2ddFf1vZdebmjtX14avG', # 環境変数
      region: 'ap-northeast-1',   # アジアパシフィック(東京)を選択した場合
      path_style: true
    }
end 