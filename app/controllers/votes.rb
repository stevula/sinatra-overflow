post '/posts/:id/votes' do
  post = Post.find(params[:id])

  # assign numeric value to up/down votes
  value = params[:value] == 'up' ? 1 : -1

  # logged in
  if current_user
    new_vote = Vote.new(
      voter_id: current_user.id,
      post_id: params[:id],
      value: value
      )

    # checks if validations prevented save - i.e. user already voted on this post
    unless new_vote.save
      # delete old vote and add new vote
      old_vote = Vote.find_by(voter_id: current_user.id, post_id: params[:id])
      old_vote.destroy
      new_vote.save
    end
  end

  # redirect to question page
  if post.post_type == "question"
    redirect "/posts/#{post.id}"
  else
    redirect "/posts/#{post.question.id}"
  end
end
