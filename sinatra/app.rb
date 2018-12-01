require 'sinatra'
require 'redis'

if ENV['REDIS_PORT_6379_TCP_ADDR']
  redis = Redis.new host: ENV['REDIS_PORT_6379_TCP_ADDR'], port: ENV['REDIS_PORT_6379_TCP_PORT']

  get '/' do
    @messages = redis.lrange :messages, 0, 9
    erb :home
  end

  post '/messages' do
    message = params[:message]
    redis.lpush :messages, message
    redirect '/'
  end

  delete '/messages' do
    redis.del :messages
    redirect '/'
  end
else
  get '/' do
    'Hello Docker World!'
  end
end
