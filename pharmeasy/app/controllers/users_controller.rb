class UsersController < ApplicationController
  before_action :authenticate_user!, :set_current_user

  def set_current_user
    @current_user = current_user
  end

  def home
    @subscription_request = @current_user.subscription_request
    @active_subscription = @current_user.active_subscription
  end

  def search
    @search_results = []
    if params[:q]
      @search_results = User.where(:users_role_id=>User::USER_ROLE_ID_SEARCH_MAP[@current_user.users_role_id]).where('uuid ILIKE ?', params[:q])
    end
  end

  def request_access
    if params[:user_uuid].present?
      requestee_id = ::User.find_by_uuid(params[:user_uuid]).id
      req = AccessRequest.find_or_create_by(:requestee_id=>requestee_id, :requester_id=>@current_user.id)
      flash[:notice] = 'Succesfuly submitted access request'
    else
      @message = "invalid user unique identity"
    end
    redirect_to '/users/access_response'
  end

  def approve_access
    if params[:user_uuid].present?
      requester_id = ::User.find_by_uuid(params[:user_uuid]).id
      req = AccessRequest.where(:requestee_id=>@current_user.id, :requester_id=>requester_id).last
      req.update_columns(status: AccessRequest::statuses[:active])
      flash[:notice] = "Succesfuly approved access request"
    else
      flash[:notice] = "invalid user unique identity"
    end
    redirect_to '/users/access_response'
  end
end