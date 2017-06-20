class Admin::DashboardsController < ApplicationController
  layout "dashboard"
  before_action :verify_admin?
  include DashboardHelper
  def index
  end
end
