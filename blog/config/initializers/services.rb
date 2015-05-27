require 'barrister-rails'
require 'barrister-redis'

class Services
  def self.post_service
    @@services ||= proxy_services
    @@services[:post_service]
  end

  def self.proxy_services
    opts = { database_url: ENV['REDIS_URL'] }
    transport = Barrister::RedisTransport.new 'post_service', opts
    # service = PostService.new MailService.new
    # idl = './services/post_service/interface.json'
    client = Barrister::Rails::Client.new transport
    { post_service: client.PostService }
  end
end
