class FuncansController < ApplicationController
  before_filter :authenticate_user!

  def index
    @funcans = Twitter.home_timeline(include_entities: true)
  end
end
