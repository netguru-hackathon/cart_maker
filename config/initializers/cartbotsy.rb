Cartbotsy.configure do |config|
  config.api_token          = AppConfig.cartbotsy.api_token
  config.webhook_token      = AppConfig.cartbotsy.webhook_token
  config.app_url            = AppConfig.cartbotsy.app_url
  config.available_cities   = AppConfig.cartbotsy.available_cities
end
