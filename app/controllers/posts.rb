get '/posts' do

  erb :'/index'
end

post '/posts' do

  redirect '/posts'
end

get '/posts/:id' do

  erb :'/posts/show'
end
