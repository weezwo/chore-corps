class ChoresController < ApplicationController
  def new
    @chore = current_family.chores.build
  end
end
