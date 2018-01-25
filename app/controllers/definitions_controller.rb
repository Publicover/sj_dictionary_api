class DefinitionsController < ApplicationController
  before_action :set_word
  before_action :set_word_definition, only: :show

  def index
    json_response(@word.definition)
  end

  def show
    json_response(@definition)
  end

  private

  def definition_params
    params.permit(:name, :word_id)
  end

  def set_word
    @word = Word.find(params[:word_id])
  end

  def set_word_definition
    @definition = Definition.find(params[:id]) if @word
  end
end
