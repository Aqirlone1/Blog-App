class CategoriesController < ApplicationController

def new
  @category = Category.new
end


def index
  @categories = Category.all
end 


def show
  @category = Category.find(params[:id])
end 


def create 
@category = Category.new(category_params)
if @category.save
     flash[:notice] = "you have successfully created category"
     redirect_to @category
else
   render 'new'
 end

end 

private

def category_params 
  params.require(:category).permit(:name)

end


end