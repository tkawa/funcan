class FuncansController < ApplicationController
  before_filter :authenticate_user!

  def index
    #@funcans = Twitter.home_timeline(include_entities: true)
    @funcans = Twitter.search('#funcan', include_entities: true)
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
    @funcan = Twitter.update(text, include_entities: true)
    if @funcan
      redirect_to root_url
    else
      redirect_to :back, :notice => 'error'
    end
  end
end
