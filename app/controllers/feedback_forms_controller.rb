class FeedbackFormsController < ApplicationController
  before_action :set_feedback_form, only: %i[ show edit update destroy ]

  # GET /feedback_forms or /feedback_forms.json
  def index
    @feedback_forms = FeedbackForm.all
  end

  # GET /feedback_forms/1 or /feedback_forms/1.json
  def show
  end

  # GET /feedback_forms/new
  def new
    @feedback_form = FeedbackForm.new
  end

  # GET /feedback_forms/1/edit
  def edit
  end

  # POST /feedback_forms or /feedback_forms.json
  def create
    @feedback_form = FeedbackForm.new(feedback_form_params)

    respond_to do |format|
      if @feedback_form.save
        format.html { redirect_to @feedback_form, notice: "Feedback form was successfully created." }
        format.json { render :show, status: :created, location: @feedback_form }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feedback_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedback_forms/1 or /feedback_forms/1.json
  def update
    respond_to do |format|
      if @feedback_form.update(feedback_form_params)
        format.html { redirect_to @feedback_form, notice: "Feedback form was successfully updated." }
        format.json { render :show, status: :ok, location: @feedback_form }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feedback_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback_forms/1 or /feedback_forms/1.json
  def destroy
    @feedback_form.destroy!

    respond_to do |format|
      format.html { redirect_to feedback_forms_path, status: :see_other, notice: "Feedback form was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback_form
      @feedback_form = FeedbackForm.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def feedback_form_params
      params.expect(feedback_form: [ :user_id, :category, :message, :submitted_at ])
    end
end
