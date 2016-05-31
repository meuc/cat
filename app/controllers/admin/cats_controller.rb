# Controller to administrate cats
module Admin
  class CatsController < AdminController
    # Display all cats
    def index
      @cats = Cat.all
    end
    
    # Render cat creation template
    def new
      @cat = Cat.new
    end
    
    # Create a new cat
    def create
      @cat = Cat.new(cat_params)
    
      if @cat.save
        redirect_to @cat
      else
        # Render "new" template:
        render :new
      end
    end
    
    # Render edit cat template
    def edit
      @cat = Cat.find(params[:id])
    end
    
    # Update cat's information
    def update
      @cat = Cat.find(params[:id])
    
      if @cat.update(cat_params)
        redirect_to @cat
      else
        # Render "edit" template:
        render :edit
      end
    end
    
    # Delete cat
    def destroy
      cat = Cat.find(params[:id])
      cat.destroy
      redirect_to cats_path
    end
    
    private
    
    def cat_params
      params.require(:cat).permit(
        :name,
        :male,
        :birthdate,
        :picture,
        :description
      )
    end
  end
end