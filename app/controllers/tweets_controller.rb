class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
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
    @tweet = set_tweet
  end
  
  def update
    @tweet = set_tweet
    if @tweet.update(tweets_params)
      redirect_to tweets_path, notice: "編集しました"
    else
      render 'edit'
    end
    
  end
  
  def destroy
    @tweet = set_tweet
    @tweet.destroy
    redirect_to tweets_path
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
    def set_tweet
      Tweet.find(params[:id])
    end
end
