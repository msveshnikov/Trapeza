class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  before_action :check_for_mobile


  # GET /categories
  def index
    @categories = Category.where("ParentCategory_ID = 0")
  end

  # GET /categories/1
  def show
    @recipes=page(@category.recipes)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

end
