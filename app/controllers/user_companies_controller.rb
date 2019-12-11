class UserCompaniesController<ApplicationController

    def new
        @company = Company.find(params[:company_id])
        @user_company = UserCompany.new(company_id: @company.id)
    end 

    def index
        @user_companies = UserCompany.where(:user_id => current_user.id).order(year: :desc)
    end

    def create
        @user_company = UserCompany.create(user_company_params)
        @user_company.user = current_user
        if @user_company.save
            flash[:notice] = "Created successfully"
            redirect_to company_path(@user_company.company)
        else 
            flash[:notice] = 'Unable to save'
            redirect_to company_path(@user_company.company)
        end 
    end 

    def destroy
        @user_company = UserCompany.find(params[:id])
        if my_uc?
        @user_company.destroy
        redirect_to user_path(@user_company.user)
        else 
            flash[:notice] = "You can't delete someone else's employment."
            redirect_to user_path(@user_company.user)
        end 
    end 

    private

    def user_company_params
        params.require(:user_company).permit(:user_id, :company_id, :year)
    end 

    def my_uc?
        UserCompany.where(user_id: current_user.id).exists?
    end 

end 