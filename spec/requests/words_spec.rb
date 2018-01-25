require 'rails_helper'

RSpec.describe 'Words API', type: :request do

  let!(:words) { create_list(:word, 5) }
  let(:word_id) { words.first.id }

  # index
  describe 'GET /words' do
    before { get '/words' }

    it 'returns words' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # show
  describe 'GET todos/:id' do
    before { get "/words/#{word_id}" }

    context 'when record exists' do
      it 'returns word' do
        expect(json).not_to be_empty
        expect(json['id']).to eq('word_id')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
