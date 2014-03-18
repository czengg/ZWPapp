class CategoryAssignmentsController < ApplicationController
  before_action :set_category_assignment, only: [:show, :edit, :update, :destroy]

  # GET /category_assignments
  # GET /category_assignments.json
  def index
    @category_assignments = CategoryAssignment.all
  end

  # GET /category_assignments/1
  # GET /category_assignments/1.json
  def show
  end

  # GET /category_assignments/new
  def new
    @category_assignment = CategoryAssignment.new
  end

  # GET /category_assignments/1/edit
  def edit
  end

  # POST /category_assignments
  # POST /category_assignments.json
  def create
    @category_assignment = CategoryAssignment.new(category_assignment_params)

    respond_to do |format|
      if @category_assignment.save
        format.html { redirect_to @category_assignment, notice: 'Category assignment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @category_assignment }
      else
        format.html { render action: 'new' }
        format.json { render json: @category_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_assignments/1
  # PATCH/PUT /category_assignments/1.json
  def update
    respond_to do |format|
      if @category_assignment.update(category_assignment_params)
        format.html { redirect_to @category_assignment, notice: 'Category assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @category_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_assignments/1
  # DELETE /category_assignments/1.json
  def destroy
    @category_assignment.destroy
    respond_to do |format|
      format.html { redirect_to category_assignments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_assignment
      @category_assignment = CategoryAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_assignment_params
      params.require(:category_assignment).permit(:tagID, :categoryID)
    end
end
