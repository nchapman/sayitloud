class Admin::TweetsController < ApplicationController
  before_filter :require_user
  before_filter :get_site
  
  # GET /tweets
  # GET /tweets.xml
  def index
    @tweets = @site.tweets.paginate(:page => params[:page], :order => "twitter_id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tweets }
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.xml
  def destroy
    @tweet = @site.tweets.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to(tweets_url) }
      format.xml  { head :ok }
    end
  end
end
