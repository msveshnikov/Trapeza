# encoding: utf-8
class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  before_action :check_for_mobile

  # GET /categories
  def index
    @categories = Category.post(post_menu?).where('ParentCategory_ID = 0')
  end

  # GET /categories/1
  def show
    @recipes = page(@category.recipes.post(post_menu?)) unless @category.keywords
    @recipes = page(@category.keyword_recipes.post(post_menu?)) if @category.keywords
    @categories = @category.categories.post(post_menu?)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
    @parent = Category.find(@category.ParentCategory_ID) if @category.ParentCategory_ID != 0
    add_breadcrumb 'МЕНЮ', :root_path
    add_breadcrumb @parent.Title, @parent if @parent
  end
end
