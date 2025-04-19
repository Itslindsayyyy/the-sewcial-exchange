class SwapsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :index ]
  before_action :set_swap, only: %i[ show edit update destroy ]

  def new
    @swap = Swap.new
    @swap.swap_tasks.build # to show one task field by default
  end


  def index
    @swaps = Swap.all
  end

def show
  @swap = Swap.find(params[:id])
  # if you need it: @participants = @swap.swap_signups
end


  def index
    @swaps = Swap.where(status: "active").order(deadline: :asc)
  end

  def edit
    @selected_themes = @swap.theme.to_s.split(",").map(&:strip)
  end


  def create
    @swap = Swap.new(swap_params)
    @swap.created_by_id = current_user.id

    # convert theme array to comma-separated string if needed
    @swap.theme = @swap.theme.join(", ") if @swap.theme.is_a?(Array)

    # Use shipping deadline as default for deadline
    @swap.deadline = @swap.shipping_deadline if @swap.deadline.blank?

    if @swap.save
      redirect_to @swap, notice: "Swap was successfully created."
    else
      Rails.logger.debug "⚠️ SWAP VALIDATION ERRORS: #{@swap.errors.full_messages}"
      render :new, status: :unprocessable_entity
    end
  end




  def update
    if params[:swap][:theme].is_a?(Array)
      params[:swap][:theme] = params[:swap][:theme].join(", ")
    end

    respond_to do |format|
      if @swap.update(swap_params)
        format.html { redirect_to @swap, notice: "Swap was successfully updated." }
        format.json { render :show, status: :ok, location: @swap }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @swap.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @swap.destroy!

    respond_to do |format|
      format.html { redirect_to swaps_path, status: :see_other, notice: "Swap was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_swap
      @swap = Swap.find(params[:id])
    end

    def swap_params
      params.require(:swap).permit(
        :title,
        :image,
        :sheet_url,
        :sheet_id,
        :start_date,
        :shipping_deadline,
        :hashtag_1,
        :hashtag_2,
        :hashtag_3,
        :rules,
        :status,
        :deadline,
        theme: [],

        swap_tasks_attributes: [ :id, :task_name, :due_date, :_destroy ]
      )
    end
end
