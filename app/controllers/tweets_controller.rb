class TweetsController < ApplicationController

  def index
  end

  def new
    @users = User.all
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
    redirect_to new_tweet_path, notice: "登録完了しました"
    else
    redirect_to new_tweet_path, alert: "入力されていない項目があります"
    end
  end

  private
  def tweet_params
      params.require(:tweet).permit(:tweet).merge(user_id: current_user.id)
  end

end
