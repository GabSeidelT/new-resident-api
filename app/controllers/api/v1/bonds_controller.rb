class Api::V1::BondsController < Api::V1::ApiController
    # before_action :authenticate_user!
    # load_and_authorize_resource
    # Autentificação comentada em todos os controllers para teste
    
    def index
        @bonds = Bond.all
        render json: @bonds
    end

    def show
        @bonds = Bond.find(params[:id])
        render json: @bonds
    end 


    def new
        @bond = Bond.new
        render json: @bond
    end

    def create 
        @bond = Bond.new(bond_params)
        unless @bond.save
            render :new, status: :unprocessable_entity
        end
        render json: @bond
    end


    def edit
        @bond = Bond.find(params[:id])
        render json: @bond
    end

    def update
        @bond = Bond.find(params[:id])
    
        unless @bond.update(bond_params)
            render :edit, status: :unprocessable_entity
        end
        render json: @bond
    end


    def destroy
        @bond = Bond.find(params[:id])
        
        if @bond.present?
           @bond.destroy 
        end
        render json: @bond
    end


    private


    def bond_params
        params.require(:bond).permit(:role, :resident_id, :company_id, :date)
    end
end
