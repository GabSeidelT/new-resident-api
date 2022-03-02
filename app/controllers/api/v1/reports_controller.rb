class Api::V1::ReportsController < Api::V1::ApiController
    # before_action :authenticate_user!
    # load_and_authorize_resource
    # Autentificação comentada em todos os controllers para teste

    def index
        @reports = Report.order(:created_at)
        render json: @reports
    end

    def show
        @report = Report.find(params[:id])
        render json: @report
    end

    def new
        @report = Report.new
        get_params
        render json: @report
    end

    def create
        @report = Report.new(report_params)
        @report.resident_id = current_user.resident_id

        unless @report.save
            render :new, status: :unprocessable_entity
        else
            render json: @report
        end
    end

    def edit
        @report = Report.find(params[:id])
    end

    def update
        @report = Report.find(params[:id])
    
        if @report.update(report_params)
            render json: @report, status: :created
        else
            render json: @report.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @report = Report.find(params[:id])
        
        if @report.present?
            @report.destroy 
        end
        render json: @report

    end

    private
    
    def report_params
        params.require(:report).permit(:content)
    end

end
