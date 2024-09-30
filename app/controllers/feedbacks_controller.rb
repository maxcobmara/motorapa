class FeedbacksController < ApplicationController

  # GET /feedbacks/new
  def index
    @feedbacks = Feedback.all
  end
  
  def new
    @feedback = Feedback.new
  end

  # POST /feedbacks or /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_back_or_to root_path, notice: "Feedback was successfully created." }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { redirect_back_or_to root_path, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Only allow a list of trusted parameters through.
    def feedback_params
      params.require(:feedback).permit(:url, :category, :name, :email, :phone, :country, :contact_me, :comment)
    end
end
