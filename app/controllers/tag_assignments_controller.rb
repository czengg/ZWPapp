class TagAssignmentsController < ApplicationController
  before_action :set_tag_assignment, only: [:show, :edit, :update, :destroy]

  # GET /tag_assignments
  # GET /tag_assignments.json
  def index
    @tag_assignments = TagAssignment.all
  end

  # GET /tag_assignments/1
  # GET /tag_assignments/1.json
  def show
  end

  # GET /tag_assignments/new
  def new
    @tag_assignment = TagAssignment.new
  end

  # GET /tag_assignments/1/edit
  def edit
  end

  # POST /tag_assignments
  # POST /tag_assignments.json
  def create
    @tag_assignment = TagAssignment.new(tag_assignment_params)

    respond_to do |format|
      if @tag_assignment.save
        format.html { redirect_to @tag_assignment, notice: 'Tag assignment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tag_assignment }
      else
        format.html { render action: 'new' }
        format.json { render json: @tag_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_assignments/1
  # PATCH/PUT /tag_assignments/1.json
  def update
    respond_to do |format|
      if @tag_assignment.update(tag_assignment_params)
        format.html { redirect_to @tag_assignment, notice: 'Tag assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tag_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_assignments/1
  # DELETE /tag_assignments/1.json
  def destroy
    @tag_assignment.destroy
    respond_to do |format|
      format.html { redirect_to tag_assignments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_assignment
      @tag_assignment = TagAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_assignment_params
      params.require(:tag_assignment).permit(:evidence_id, :tag_id, :rating)
    end
end
