class Admin::RecipesController < Admin::BaseController

  def index
    @recipes = Recipe.all.order(:name)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      params[:ingredient][:ingredient_id].each do |i|
        @recipe.ingredients_recipes.create(ingredient_id: i)
      end
      redirect_to @recipe, notice: "Recipe saved"
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      @recipe.ingredients.delete_all
      params[:ingredient][:ingredient_id].each do |i|
        @recipe.ingredients_recipes.create(ingredient_id: i)
      end
      redirect_to admin_recipes_path, notice: "Recipe updated"
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to admin_recipes_path, notice: "Recipe deleted"
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_id, :ingredient_details, :description, :img_url)
  end
end
