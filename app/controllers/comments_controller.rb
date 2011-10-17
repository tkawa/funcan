class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def update
    sid = params[:id]
    tweet = Funcan.find_or_create_by_sid(sid)
    comment_klass = params[:type].camelize.constantize
    comment = comment_klass.find_by_sid_and_user_id(sid, current_user.id) ||
              comment_klass.new(sid: sid, uid: current_user.uid, user_id: current_user.id, text: '')
    comment.text = params[:text] if params[:text].present?
    comment.quantity += 1
    tweet.comments << comment

    tweet.save!
    if request.xhr?
      render :json => comment
    else
      redirect_to root_url
    end
  end

  def destroy
    
  end
end
