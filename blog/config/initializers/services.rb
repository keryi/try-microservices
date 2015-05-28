require 'barrister-rails'

class Services
  def self.post_service
    @@services ||= proxy_services
    @@services[:post_service]
  end

  def self.proxy_services
    service = PostService.new
    idl = './services/post_service/interface.json'
    client = Barrister::Rails::Client.new service, idl
    { post_service: client.PostService }
  end
end
