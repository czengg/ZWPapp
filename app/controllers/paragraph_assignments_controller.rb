class ParagraphAssignmentController < ApplicationController
  before_action :set_paragraph_assignment, only: [:show, :edit, :update, :destroy]

  # GET /paragraph_assignments
  # GET /paragraph_assignments.json
  def index
    @paragraph_assignments = ParagraphAssignment.all
  end

  # GET /paragraph_assignments/1
  # GET /paragraph_assignments/1.json
  def show
  end

  # GET /paragraph_assignments/new
  def new
    @paragraph_assignment = ParagraphAssignment.new
  end

  # GET /paragraph_assignments/1/edit
  def edit
  end

  # POST /paragraph_assignments
  # POST /paragraph_assignments.json
  def create
    @paragraph_assignment = ParagraphAssignment.new(paragraph_assignment_params)

    respond_to do |format|
      if @paragraph_assignment.save
        format.html { redirect_to @paragraph_assignment, notice: 'Paragraph assignment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @paragraph_assignment }
      else
        format.html { render action: 'new' }
        format.json { render json: @paragraph_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paragraph_assignments/1
  # PATCH/PUT /paragraph_assignments/1.json
  def update
    respond_to do |format|
      if @paragraph_assignment.update(paragraph_assignment_params)
        format.html { redirect_to @paragraph_assignment, notice: 'Paragraph assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @paragraph_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paragraph_assignments/1
  # DELETE /paragraph_assignments/1.json
  def destroy
    @paragraph_assignment.destroy
    respond_to do |format|
      format.html { redirect_to paragraph_assignments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paragraph_assignment
      @paragraph_assignment = ParagraphAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paragraph_assignment_params
      params.require(:paragraph_assignment).permit(:paragraph_id, :report_id, :active)
    end
end

