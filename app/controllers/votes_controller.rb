class VotesController < ApplicationController
  before_filter :authenticate_user!, except: :show

  def show
    funcan = Funcan.find_by_sid(params[:funcan_id])
    unless funcan
      head :not_found
      return
    end
    votes = funcan.send(params[:type].pluralize)
    if request.xhr?
      render partial: 'users', locals: {votes: votes, type: params[:type]}
    else

    end
  end

  def create
    sid = params[:funcan_id]
    funcan = Funcan.find_or_create_by_sid(sid)
    vote_klass = params[:type].camelize.constantize
    vote =
      vote_klass.find_by_sid_and_user_id(sid, current_user.id) ||
      vote_klass.new(sid: sid, uid: current_user.uid, user_id: current_user.id, text: '')
    vote.text = params[:text] if params[:text].present?
    vote.quantity += 1
    count = funcan.send("#{params[:type]}_count")
    count += 1 if vote.new_record?
    funcan.votes << vote

    if request.xhr?
      if funcan.save
        render json: {count: count}
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
