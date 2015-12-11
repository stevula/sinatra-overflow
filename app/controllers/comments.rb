post '/posts/:id/comments' do
  p params, current_user.id

  if params[:answer_id]
    post_id = params[:answer_id]
  else
    post_id = params[:id]
  end

  Comment.create(
    body:params[:body],
    post_id: post_id,
    author_id:current_user.id
    )
  redirect "posts/#{params[:id]}"
end
