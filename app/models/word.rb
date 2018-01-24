# word that is searched for definition in api request
class Word < ApplicationRecord
  has_one :definition, dependent: :destroy
  validates_presence_of :name
end
