require 'rails_helper'

RSpec.describe :movies, type: :request do
  
  describe 'index' do
    let(:movie_1) do
      Movie.create(title: 'A movie',
                   rating: 'PG', 
                   release_date: 1.months.ago) 
    end
    let(:movie_2) do
      Movie.create(title: 'B movie',
                   rating: 'PG',
                   release_date: 3.months.ago)
    end

    before do
      movie_1
      movie_2
    end

    context 'when there is no sort parameters' do
      it 'return 200' do
        get(movies_path)
        expect(response).to be_successful
      end
    end

    context 'when there is a sort parameter' do
      it 'return movies order by title' do
        get(movies_path(order_by: :title))
        expect(response).to be_successful
        expect(assigns(:movies).first.title).to eq(movie_1.title)
      end
      it 'return movies order by release_date' do
        get(movies_path(order_by: :release_date))
        expect(response).to be_successful
        expect(assigns(:movies).first.title).to eq(movie_2.title)
      end
    end  
  end
end          
