class ThingsController < ApplicationController
  
  before_filter :require_user, :except => [ :index, :new ]
  
  def index
    @things = Thing.paginate(:page => params[:page], :per_page => 10)
  end
  
  def show
    @thing = Thing.find(params[:id])
  end
  
  def new
    @thing = current_user.things.build
  end
  
  def create
    @thing = current_user.things.build(params[:thing])
    if @thing.save
      redirect_to thing_path(@thing), :notice => "Created sucucess!"
    else
      render :new
    end
  end
  
  def update
    @thing = current_user.things.find(params[:id])
    if @thing.update_attributes(params[:thing])
       redirect_to thing_path(@thing), :notice => "Updated sucucess!"
    else
       render :edit
    end
  end
  
  def destroy
    @thing = current_user.things.find(params[:id])
    @thing.destroy
    
    redirect_to things_url, :warning => "Delete success"
  end
  
  def edit
    @thing = current_user.things.find(params[:id])
  end
end
