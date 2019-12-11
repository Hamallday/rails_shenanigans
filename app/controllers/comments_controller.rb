class CommentsController<ApplicationController
    include ::CommentsHelper
    before_action :logged_in?, only: [:create]
    before_action :find_review

    def new
        @comment = Comment.new
    end 
    
    def index
        @comments = Comment.all(comment_params[:review_id])
    end 

    def show
        @comment = Comment.find(params[:id])
    end 

    def create 
        @comment = Comment.create(comment_params)
        @comment.user_id = current_user.id
        @comment.review_id = params[:review_id]
        if @comment.save
            redirect_to review_path(params[:review_id])
        else
            flash[:notice] = "Commment not saved."
            render 'new'
          end 
    end 

    private

    def comment_params
        params.require(:comment).permit(:content, :review_id, :user_id)
    end 

    def find_review
        @review = Review.find(params[:review_id])
    end 
end