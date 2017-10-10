if Rails.env.production?
  Resque.redis = Redis.new(url: ENV['REDIS_URL'])
  Resque.logger = Rails.logger
  Resque.after_fork do
    ActiveRecord::Base.establish_connection
  end
  Resque.before_fork do
    ActiveRecord::Base.connection_pool.disconnect
  end
end
