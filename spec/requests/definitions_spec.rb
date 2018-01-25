require 'rails_helper'

RSpec.describe 'Definitions API', type: :request do
  let!(:word) { create(:word) }
  let!(:definitions) { create_list(:definition, 5, word_id: word.id) }
  let(:word_id) { word.id }
  let(:id) { definitions.first.id }

  # definitions index
  describe 'GET /words/:word_id/definitions' do
    before { get "/words/#{word_id}/definitions"}

    context 'when word exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all definitions' do
        expect(json.size).to eq(5)
      end
    end

    context 'when word does not exist' do
      let(:word_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Word/)
      end
    end
  end

  # definitions show
  describe 'GET /words/:word_id/definitions/:id' do
    before { get "/words/#{word_id}/definitions/#{id}"}

    context 'when definition exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the definition' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when definition does not exist' do 
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Definition/)
      end
    end
  end
end
