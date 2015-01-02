# encoding: utf-8
class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :check_for_mobile

  # GET /recipes
  def index
    if params[:search]
      @recipes = page(Recipe.search(params[:search]))
      redirect_to recipe_path(@recipes[0]) if @recipes.size==1
    else
      @recipes = page(Recipe)
    end
  end

  # GET /recipes/1
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
    @category = Category.find(@recipe.subcategory_id)
    @parent = Category.find(@category.ParentCategory_ID) if @category.ParentCategory_ID != 0
    add_breadcrumb "МЕНЮ", :root_path
    add_breadcrumb @parent.Title, @parent unless @parent.blank?
    add_breadcrumb @category.Title, @category
  end

  # Only allow a trusted parameter "white list" through.
  def recipe_params
    params.require(:recipe).permit(:Date, :Title, :category_id)
  end


end
