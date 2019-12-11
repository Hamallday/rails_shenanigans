class CompaniesController<ApplicationController

    def new
        @company = Company.new
    end 

    def index
        @current_user = current_user
        @companies = Company.all
    end
    
    def create
        @company = Company.create(company_params)
       
        if @company.save
            flash[:notice] = "Company created successfully"
            redirect_to company_path(@company)
        else 
            flash[:notice] = 'Unable to save this company'
            render 'companies/new'
        end 
    end

    def show
        @company = Company.find(params[:id])
    end 

    def destroy
        @company = Company.find(params[:id])
        @company.destroy
        flash[:success] = 'Company deleted'
        redirect_to companies_path
    end 

    private

    def company_params
        params.require(:company).permit(:name, :headquarters, :industry, :number_of_employees, :revenue,
        :mission_motto_ideal, :publicly_owned, :website)
    end 
end