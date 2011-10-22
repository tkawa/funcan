class FuncansController < ApplicationController
  before_filter :authenticate_user!

  def index
    raw = Twitter.search('#funcan', include_entities: true)
    #funcan_cache = Funcan.where(sid: raw.map(&:id_str)).all
    @tweets = raw.map {|t| FuncanDelegator.new(t) }
  end

  def public
    @tweets = Twitter.public_timeline(include_entities: true).map {|t| FuncanDelegator.new(t) }
    render :index
  end

  def create
    hashtags =
      case params[:type]
        when 'fun'
          '#funcan #fun'
        when 'can'
          '#funcan #can'
        else
          '#funcan'
      end
    @tweet = Tweet.new(text: params[:text], hashtags: hashtags)
    if @tweet.save
      render partial: 'funcan', locals: { tweet: FuncanDelegator.new(@tweet.raw) }
    else
      redirect_to :back, :notice => 'error'
    end
  end
end
