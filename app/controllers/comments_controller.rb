class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def update
    sid = params[:id]
    funcan = Funcan.find_or_create_by_sid(sid)
    comment_klass = params[:type].camelize.constantize
    comment = comment_klass.find_by_sid_and_user_id(sid, current_user.id) ||
              comment_klass.new(sid: sid, uid: current_user.uid, user_id: current_user.id, text: '')
    comment.text = params[:text] if params[:text].present?
    comment.quantity += 1
    count = funcan.send("#{params[:type]}_count")
    count += 1 if comment.new_record?
    funcan.comments << comment

    if request.xhr?
      if funcan.save
        render json: count
      else
        head :bad_request # 400 Bad Request
      end
    else
      if funcan.save
        redirect_to root_url, notice: 'count up'
      else
        redirect_to root_url, alert: 'error'
      end
    end
  end

  def destroy
    
  end
end
