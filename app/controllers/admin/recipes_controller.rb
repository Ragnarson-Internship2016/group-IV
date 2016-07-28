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
      redirect_to @recipe, notice: "Recipe saved"
    else
      render 'new'
    end
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(params[:id])
      redirect_to @recipe, notice: "Recipe updated"
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
    params.require(:recipe).permit(:name, :ing_description, :description, :img_url)
  end
end
