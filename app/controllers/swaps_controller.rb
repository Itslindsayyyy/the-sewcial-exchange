class SwapsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]
  before_action :set_swap, only: %i[ show edit update destroy ]

  def index
    @swaps = Swap.all
  end

  def show
  end

  def index
    @swaps = Swap.where(status: "active").order(deadline: :asc)
  end

  def edit
    @selected_themes = @swap.theme.to_s.split(",").map(&:strip)
  end
  

  def create
    if params[:swap][:theme].is_a?(Array)
      params[:swap][:theme] = params[:swap][:theme].join(", ")
    end

    @swap = Swap.new(swap_params)
    @swap.created_by_id = current_user.id #assigns current user as host


    respond_to do |format|
      if @swap.save
        format.html { redirect_to @swap, notice: "Swap was successfully created." }
        format.json { render :show, status: :created, location: @swap }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @swap.errors, status: :unprocessable_entity }
      end
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
        :swap_group_id, :title, :theme, :deadline, :status, :rules,
        swap_tasks_attributes: [:name, :due_date]
      )
    end
end
