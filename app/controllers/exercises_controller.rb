class ExercisesController < ApplicationController
  def index

  end

  def new
    @exercise = current_user.exercises.new
  end

  def create
    @exercise = Exercise.create
  end
end
