class ProfilesController<ApplicationController

    def new 
        @profile = Profile.new 
    end 

    def create
       
        @profile = Profile.create(profile_params)
        @profile.user_id = current_user.id
        if @profile.save 
          flash[:notice] = "You created your User Profile successfully"
          redirect_to user_path(@profile.user)
        else
          flash[:notice] = "Unable to create your User Profile."
          
            render 'profiles/new'
        end 
    end 

    def show
      @profile = Profile.find(params[:id])
    end 

    private 

    def profile_params
        params.require(:profile).permit(:username, :age, :ethnicity, 
        :sexorientation, :nationality, :gender, :employed, :bio)
    
    end 
    

end 