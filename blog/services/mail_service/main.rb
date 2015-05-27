require 'barrister-redis'

opts = {
  database_url: ENV['REDIS_URL'],
  list_name: 'mail_service'
}

Barrister::RedisContainer.new('./interface.json', MailService.new, opts).start
