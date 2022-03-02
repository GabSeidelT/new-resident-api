class Api::V1::CompaniesController < Api::V1::ApiController
    # before_action :authenticate_user!
    # load_and_authorize_resource
    # Autentificação comentada em todos os controllers para teste

    def index
        @companies = Company.order(:created_at)
        render json: @companies
    end

    def show
        @search = Company.find(params[:id])
        render json: @search
    end

    def new
        @company = Company.new
    end

    def create 
        @company = Company.new(company_params)
    
        unless @company.save
            render :new, status: :unprocessable_entity
        else
            render json: @company
        end
    end


    def edit
        @company = Company.find(params[:id])
    end

    def update
        @company = Company.find(params[:id])
    
        unless @company.update(company_params)
            render :edit, status: :unprocessable_entity
        else
            render json: @company
        end
    end


    def destroy
        @company = Company.find(params[:id])
        
        if @company.present?
           @company.destroy 
           render json: Company.all
        end
    end

    def companies_cordinates
        @cordinates = Company.pluck(:lat, :long)
        render json: @cordinates
    end

    private
    def company_params
        params.require(:company).permit(:name, :website, :logo, :email, :lat, :long, :telephone)
    end
end
