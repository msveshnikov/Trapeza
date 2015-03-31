# encoding: utf-8
class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]
  before_action :check_for_mobile

  # GET /recipes
  def index
    add_breadcrumb 'МЕНЮ', :root_path
    if params[:search]
      @recipes = page(Recipe.search(params[:search]))
      redirect_to recipe_path(@recipes[0]) if @recipes.size == 1
    else
      @recipes = page(Recipe.all)
    end
  end

  # GET /recipes/1
  def show
    @comments = @recipe.comments
    @visit = @recipe.visits.build(ip: request.remote_ip.encode('ascii'))
    @visit.save
  end

  def popular
    add_breadcrumb 'МЕНЮ', :root_path
    @today = Rails.cache.fetch('today', expires_in: 8.hours) do
      Recipe.find_by_sql('SELECT recipes.id,Title,Media,count(ip) as c
    FROM recipes INNER JOIN visits ON recipes.id = visits.recipe_id
    WHERE created_at BETWEEN now() - INTERVAL 1 day AND now()
    GROUP BY recipes.id ORDER BY c desc LIMIT 10')
    end
    @total = Rails.cache.fetch('total', expires_in: 14.days) do
      Recipe.find_by_sql('SELECT recipes.id,Title,Media,count(ip) as c
    FROM recipes INNER JOIN visits ON recipes.id = visits.recipe_id
    GROUP BY recipes.id ORDER BY c desc LIMIT 10')
    end
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
      redirect_to @recipe, notice: 'Рецепт был создан успешно.'
    else
      render action: 'new'
    end
  end

  def toggle
    s = cookies[:fav]
    s = '' if s.blank?
    f = s.split(',')
    if f.include? params[:id]
      f.delete params[:id]
      render text: 'heart-off.png'
    else
      f << params[:id]
      render text: 'heart-on.png'
    end
    cookies.permanent[:fav] = f.join(',')
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Рецепт был обновлен успешно.'
    else
      render action: 'edit'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
    @category = Category.find(@recipe.subcategory_id)
    @parent = Category.find(@category.ParentCategory_ID) if @category.ParentCategory_ID != 0
    add_breadcrumb 'МЕНЮ', :root_path
    add_breadcrumb @parent.Title, @parent if @parent
    add_breadcrumb @category.Title, @category
  end

  # Only allow a trusted parameter "white list" through.
  def recipe_params
    params.require(:recipe).permit(:Date, :Title, :category_id, :IsNew)
  end
end
