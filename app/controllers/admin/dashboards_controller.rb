class Admin::DashboardsController < ApplicationController
  layout "dashboard"
  include DashboardHelper
  def index
  end
end
