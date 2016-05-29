module Admin
  class CatsController < AdminController
    def index
      @cats = Cat.all
    end
    
    def new
      @cat = Cat.new
    end
    
    def create
      @cat = Cat.new(cat_params)
    
      if @cat.save
        redirect_to @cat
      else
        # Render "new" template:
        render :new
      end
    end
    
    def edit
      @cat = Cat.find(params[:id])
    end
    
    def update
      @cat = Cat.find(params[:id])
    
      if @cat.update(cat_params)
        redirect_to @cat
      else
        # Render "edit" template:
        render :edit
      end
    end
    
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