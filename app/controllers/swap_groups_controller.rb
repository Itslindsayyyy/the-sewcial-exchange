class SwapGroupsController < ApplicationController
  before_action :set_swap_group, only: %i[ show edit update destroy ]

  # GET /swap_groups or /swap_groups.json
  def index
    @swap_groups = SwapGroup.all
  end

  # GET /swap_groups/1 or /swap_groups/1.json
  def show
  end

  # GET /swap_groups/new
  def new
    @swap_group = SwapGroup.new
  end

  # GET /swap_groups/1/edit
  def edit
  end

  # POST /swap_groups or /swap_groups.json
  def create
    @swap_group = SwapGroup.new(swap_group_params)

    respond_to do |format|
      if @swap_group.save
        format.html { redirect_to @swap_group, notice: "Swap group was successfully created." }
        format.json { render :show, status: :created, location: @swap_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @swap_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swap_groups/1 or /swap_groups/1.json
  def update
    respond_to do |format|
      if @swap_group.update(swap_group_params)
        format.html { redirect_to @swap_group, notice: "Swap group was successfully updated." }
        format.json { render :show, status: :ok, location: @swap_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @swap_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swap_groups/1 or /swap_groups/1.json
  def destroy
    @swap_group.destroy!

    respond_to do |format|
      format.html { redirect_to swap_groups_path, status: :see_other, notice: "Swap group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swap_group
      @swap_group = SwapGroup.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def swap_group_params
      params.expect(swap_group: [ :name, :description, :created_by_id ])
    end
end
