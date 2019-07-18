class ApplicationController < Sinatra::Base
  set :views, proc { File.join(root, '../views/') }
  register Sinatra::Twitter::Bootstrap::Assets

  configure do
    set :method_override, true
  end

  get '/' do
    erb :"application/index"
  end
end
