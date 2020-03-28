class StudentsController < ApplicationController
  before_action :check_login
  before_action :get_student, except: [:index, :create]

  def index
    @students = Student.all
  end

  def show
  end

  def new
  end

  def create
    @student = Student.create(student_params)
    if @student.valid? then
      redirect_to student_path(@student)
    else
      # show the errors
      redirect_to new_student_path(@student)
    end
  end

  def edit
  end

  def update
    @student.update(student_params)
    if @student.valid? then
      redirect_to student_path(@student)
    else
      # show the errors
      redirect_to edit_student_path(@student)
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :mod)
  end

  def get_student
    @student = Student.find_by(id: params[:id]) || Student.new
  end

end
