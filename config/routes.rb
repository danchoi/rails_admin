Rails.application.routes.draw do

  # Prefix route urls with "admin" and route names with "rails_admin_"
  scope "admin", :module => :rails_admin, :as => "rails_admin" do
    # Routes for rails_admin controller
    controller "main" do
      match "/", :to => :index, :as => "dashboard"
      match "/:model_name", :to => :list, :as => "list"
      match "/:model_name/get_pages", :to => :get_pages, :as => "get_pages"
      match "/:model_name/history", :to => :show_history, :as => "show_history"
      %w(new create edit update delete destroy).each do |action|
        match "/:model_name/#{action}", :to => action.to_sym, :as => action
      end
    end
    scope "history", :as => "history" do
      controller "history" do
        match "/list", :to => :list, :as => "list"
      end
    end
  end

end
