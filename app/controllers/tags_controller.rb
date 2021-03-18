class TagsController < ApplicationController

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

  end

  private

    def tag_params
      params.require(:tag).permit(:semester, :course, :others, :degree, :book_id)
    end

end
