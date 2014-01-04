class OwnersController < ApplicationController

  def index
    @owners=Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      flash[:owner_added] = 'Owner Added!'
      redirect_to new_owner_path
    else 
      flash.now[:owner_not_added] = "Please Fill out a first name, last name, and email" 
      render :new
    end
  end

  def destroy
    @owner = Owner.find(params[:id])
    @owner.delete
    # redirect_to blog_posts_path
  end
  
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email_address, :companny_name)
  end


end
