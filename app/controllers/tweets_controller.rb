class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
      redirect_to tweets_path, notice: "つぶやきました"
    else
      render 'new'
    end
  end
  
  def edit
    # @tweet = Tweet.find(params[:id])
    @tweet = set_tweet
  end
  
  def update
    # @tweet = Tweet.find(params[:id])
    @tweet = set_tweet
    if @tweet.update(tweets_params)
      redirect_to tweets_path, notice: "編集しました"
    else
      render 'edit'
    end
    
  end
  
  def destroy
    # @tweet = Tweet.find(params[:id])
    @tweet = set_tweet
    @tweet.destroy
    redirect_to tweets_path
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
    def set_tweet
      Tweet.find(params[:id])
    end
end
