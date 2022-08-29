class TodosController < ApplicationController
    

  def index 
    @todos = Todo.all
  end 

  def show 
    @todo =Todo.find(params[:id])
  end

 def new
   @todo = Todo.new
 end

  def edit
    @todo = Todo.find(params[:id])
  end
  
  def update
       @todo = Todo.find(params[:id])
      if @todo.update(params.require(:todo).permit(:title, :description, :feedback))   
         flash[:notice] = "Article updated successfully"
          redirect_to @todo
      else
         render 'edit' 
      end
       
  end 

 def create 
     @todo =Todo.new(params.require(:todo).permit(:title, :description, :feedback))     
    if  @todo.save
      flash[:notice] = "Article created successfully"
      redirect_to @todo
    else
      render 'new' 
    end 
 end

 def destroy
   @todo =Todo.find(params[:id])
   @todo.destroy
   redirect_to todos_path
 end

end     