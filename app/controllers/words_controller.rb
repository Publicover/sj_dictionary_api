class WordsController < ApplicationController
  before_action :set_word, only: :show

  def index
    @words = Word.all
    json_response(@words)
  end

  def show
    json_response(@word)
  end

  private

  def word_params
    params.permit(:name)
  end

  def set_word
    @word = Word.find(params[:id])
  end
end
