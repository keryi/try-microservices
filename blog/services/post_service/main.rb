require 'barrister-redis'
require 'activerecord'

db_config = YAML.load(ERB.new(File.read('../../config/database.yml')).result)
ActiveRecord::Base.establish_connection db_config[ENV['RACK_ENV'] || 'development']

opts = { database_url: ENV['REDIS_URL'], list_name: 'post_service' }
transport = Barrister::RedisTransport opts
mail_service = Barrister::Client.new(transport).MailService

idl = './post_service.json'
service = PostService.new mail_service

Barrister::RedisContainer.new(idl, service, opts).start
