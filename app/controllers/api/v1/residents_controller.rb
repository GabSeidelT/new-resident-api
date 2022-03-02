class Api::V1::ResidentsController < Api::V1::ApiController
    # before_action :authenticate_user!
    # load_and_authorize_resource
    # Autentificação comentada em todos os controllers para teste

    def index
        @residents = Resident.order(:created_at)
        render json: @residents
    end

    def show
        @resident = Resident.find(params[:id])
        render json: @resident
    end

    def total
        @total = Bond.group(:company_id).count
        render json: @total

    end

    def create 
        @resident = Resident.new(resident_params)

        if @resident.save
            render json: @resident, status: :created
        else
            render json: @resident.errors, status: :unprocessable_entity
        end

    end

    def update
        @resident = Resident.find(params[:id])
    
        if @resident.update(resident_params)
            render json: @resident, status: :created
        else
            render json: @resident.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @resident = Resident.find(params[:id])
        
        if @resident.present?
            @resident.destroy 
        end
        render json: @resident
    end

    private

    def resident_params
        params.require(:resident).permit(:name, :email, :whatsapp, :registration_id, :initial_date, :final_date)
    end
    
end