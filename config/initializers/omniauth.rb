Rails.application.config.middleware.use OmniAuth::Builder do
  provider :jawbone, ENV['JAWBONE_CLIENT_ID'], ENV['JAWBONE_CLIENT_SECRET'],
    # scope: "basic_read extended_read mood_read move_read sleep_read generic_event_read"
    scope: "basic_read extended_read location_read friends_read mood_read move_read sleep_read meal_read generic_event_read"
end
