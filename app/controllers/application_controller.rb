class ApplicationController < ActionController::Base
  before_action :search_ransack

  def search_ransack
    @q = Task.ransack(params[:q])
    @stasks = @q.result(distinct: true) 
  end

end
