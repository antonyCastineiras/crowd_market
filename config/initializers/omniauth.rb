Rails.application.config.middleware.use OmniAuth::Builder do
  provider :paypal, ENV["APP_ID"], ENV["TOKEN_ID"], sandbox: true, scope: "openid profile email"
end
