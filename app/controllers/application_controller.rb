class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # include Pundit

  # after_action :verify_authorized, except: [:index, :home]
  # after_action :verify_policy_scoped, only: :index
end
