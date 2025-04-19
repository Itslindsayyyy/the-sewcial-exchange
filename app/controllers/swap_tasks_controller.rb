class SwapTasksController < ApplicationController
  before_action :set_swap_task, only: %i[ show edit update destroy ]

  # GET /swap_tasks or /swap_tasks.json
  def index
    @swap_tasks = SwapTask.all
  end

  # GET /swap_tasks/1 or /swap_tasks/1.json
  def show
  end

  # GET /swap_tasks/new
  def new
    @swap_task = SwapTask.new
  end

  # GET /swap_tasks/1/edit
  def edit
  end

  # POST /swap_tasks or /swap_tasks.json
  def create
    @swap_task = SwapTask.new(swap_task_params)

    respond_to do |format|
      if @swap_task.save
        format.html { redirect_to @swap_task, notice: "Swap task was successfully created." }
        format.json { render :show, status: :created, location: @swap_task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @swap_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swap_tasks/1 or /swap_tasks/1.json
  def update
    respond_to do |format|
      if @swap_task.update(swap_task_params)
        format.html { redirect_to @swap_task, notice: "Swap task was successfully updated." }
        format.json { render :show, status: :ok, location: @swap_task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @swap_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swap_tasks/1 or /swap_tasks/1.json
  def destroy
    @swap_task.destroy!

    respond_to do |format|
      format.html { redirect_to swap_tasks_path, status: :see_other, notice: "Swap task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swap_task
      @swap_task = SwapTask.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def swap_task_params
      params.expect(swap_task: [ :swap_id, :task_name, :due_date, :assigned_to_user_id, :completed ])
    end
end
