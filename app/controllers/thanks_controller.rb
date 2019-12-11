class ThanksController<ApplicationController
    before_action :find_review

    def create
        if already_thanked?
            flash[:notice] = "You can't thank more than once."
        else    
            @review.thanks.create(user_id: current_user.id)
        end     
            redirect_to review_path(@review)
    end 

    private

    def already_thanked?
        Thank.where(user_id: current_user.id, review_id:
        params[:review_id]).exists?
    end  

    def find_review
        @review = Review.find(params[:review_id])
    end 
    
    

end