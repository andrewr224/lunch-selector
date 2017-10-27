module MealsHelper
  def meal_params
    params.require(:meal).permit(:name, :course, :price)
  end
end
