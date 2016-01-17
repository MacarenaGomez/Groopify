class UsersController < ApplicationController
  
  def json
    user = User.find_by_id(params[:id])
    render status:200, json:user
  end

end
