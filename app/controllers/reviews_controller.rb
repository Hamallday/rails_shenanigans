class ReviewsController < ApplicationController
    include ::ReviewsHelper
    before_action :logged_in?, only: [:create]
    before_action :employed_here?, only: [:new, :create]
    
    def new
      @review = Review.new 
    end 

    def index
      @reviews = Review.all(review_params[:company_id]) 
    end

    def show
      @company = Company.find_by(id: params[:id])
      @review = Review.find_by(id: params[:id])
    end

    def create
      @review = Review.create(review_params)
      @review.user_id = current_user.id
      @review.company_id = params[:company_id]
      if @review.save
        redirect_to company_path(@review.company)
      else 
        flash[:notice] = "Review not saved."
        render 'new'
      end 
    end

   
    
    
    private

      def review_params
        params.require(:review).permit(:rating, :content, :title, :company_id)
      end 

      def company_params
        params.require(:company).permit(:name, :headquarters, :industry, :sizeNumberofEmployees, :revenue, 
        :mission_motto_ideal, :publicly_owned, :website)
      end 

end 