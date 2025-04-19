class UserSwapTasksController < ApplicationController
  before_action :set_user_swap_task, only: %i[ show edit update destroy ]

  # GET /user_swap_tasks or /user_swap_tasks.json
  def index
    @user_swap_tasks = UserSwapTask.all
  end

  # GET /user_swap_tasks/1 or /user_swap_tasks/1.json
  def show
  end

  # GET /user_swap_tasks/new
  def new
    @user_swap_task = UserSwapTask.new
  end

  # GET /user_swap_tasks/1/edit
  def edit
  end

  # POST /user_swap_tasks or /user_swap_tasks.json
  def create
    @user_swap_task = UserSwapTask.new(user_swap_task_params)

    respond_to do |format|
      if @user_swap_task.save
        format.html { redirect_to @user_swap_task, notice: "User swap task was successfully created." }
        format.json { render :show, status: :created, location: @user_swap_task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_swap_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_swap_tasks/1 or /user_swap_tasks/1.json
  def update
    respond_to do |format|
      if @user_swap_task.update(user_swap_task_params)
        format.html { redirect_to @user_swap_task, notice: "User swap task was successfully updated." }
        format.json { render :show, status: :ok, location: @user_swap_task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_swap_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_swap_tasks/1 or /user_swap_tasks/1.json
  def destroy
    @user_swap_task.destroy!

    respond_to do |format|
      format.html { redirect_to user_swap_tasks_path, status: :see_other, notice: "User swap task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_swap_task
      @user_swap_task = UserSwapTask.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_swap_task_params
      params.expect(user_swap_task: [ :user_id, :swap_task_id, :completed ])
    end
end
