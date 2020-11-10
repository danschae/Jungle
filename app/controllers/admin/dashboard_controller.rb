class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name =>  "#{ENV["username"]}", :password => "#{ENV["password"]}"
  def show
    @counted_products = Product.count
    @counted_categories = Category.count
  end
end
