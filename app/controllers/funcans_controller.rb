class FuncansController < ApplicationController
  before_filter :authenticate_user!

  def index
    raw = Twitter.search('#funcan', include_entities: true)
    #funcan_cache = Funcan.where(:sid => raw.map(&:id_str)).all
    @tweets = raw.map {|t| TweetDelegator.new(t) }
  end

  def public
    @tweets = Twitter.public_timeline(include_entities: true).map {|t| TweetDelegator.new(t) }
    render :index
  end

  def create
    hashtag =
      case params[:kind]
        when 'fun'
          '#funcan #fun'
        when 'can'
          '#funcan #can'
        else
          '#funcan'
      end
    text = params[:text] + ' ' + hashtag
    @tweet = Tweet.new(text: text)
    if @tweet.save
      redirect_to root_url
    else
      redirect_to :back, :notice => 'error'
    end
  end
end
