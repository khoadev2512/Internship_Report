# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  describe 'GET #index' do
    let(:authors) { FactoryBot.create_list(:author, 50) }

    it 'View the list of authors' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'JSON return 5 authors' do
      get :index, as: :json
      expect(JSON.parse(response.body).count).to eq(5)
    end
  end

  describe 'GET /authors/_id' do
    context 'when author is not found' do
      it 'redirects to authors_url' do
        get :show, params: { id: 51 }

        expect(response).to redirect_to(authors_url)
      end

      it 'sets a flash notice' do
        get :show, params: { id: 23 }

        expect(flash[:notice]).to eq('Author not found')
      end
    end

    context 'when author is found' do
      let(:author) { FactoryBot.create(:author) }

      it 'renders the show template' do
        get :show, params: { id: author.id }

        expect(response).to render_template(:show)
      end
    end
  end

  describe 'GET #new' do
    it 'Render new page' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:author) { FactoryBot.create(:author) }
    let(:valid_params) { { author: FactoryBot.attributes_for(:author) } }
    let(:invalid_params) { { author: FactoryBot.attributes_for(:author, first_name: nil) } }

    context 'with valid parameters' do
      it 'creates a new author' do
        expect do
          post :create, params: valid_params
        end.to change(Author, :count).by(1)
      end

      it 'redirects to authors_url' do
        post :create, params: valid_params
        expect(response).to redirect_to(authors_url)
      end

      it 'sets a flash notice' do
        post :create, params: valid_params
        expect(flash[:notice]).to eq('Author was successfully created.')
      end

      it 'sends a welcome email' do
        expect do
          post :create, params: valid_params
        end.to change { ActionMailer::Base.deliveries.count }.by(1)
      end

      it 'calls the announce method after save' do
        expect_any_instance_of(Author).to receive(:announce)
        post :create, params: valid_params
      end

      it 'and check if the created equal to the one save to db' do
        post :create, params: valid_params
        created_author = Author.last

        expect(created_author.first_name).to eq(valid_params[:author][:first_name])
        expect(created_author.last_name).to eq(valid_params[:author][:last_name])
        expect(created_author.title).to eq(valid_params[:author][:title])
        expect(created_author.email).to eq(valid_params[:author][:email])
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new author' do
        expect do
          post :create, params: invalid_params
        end.not_to change(Author, :count)
      end

      it 'redirects to new_author_url' do
        post :create, params: invalid_params
        expect(response).to redirect_to(new_author_url)
      end

      it 'sets a flash notice with errors' do
        post :create, params: invalid_params
        expect(flash[:notice]).to include("First name can't be blank")
      end

      it 'does not send a welcome email' do
        expect do
          post :create, params: invalid_params
        end.not_to(change { ActionMailer::Base.deliveries.count })
      end

      it 'does not call the announce method after save' do
        expect_any_instance_of(Author).not_to receive(:announce)
        post :create, params: invalid_params
      end
    end
  end

  describe 'PATCH #update' do
    let(:author) { FactoryBot.create(:author) }
    let(:valid_attributes) { { first_name: 'John' } }
    let(:invalid_attributes) { { first_name: nil } }

    context 'with valid params' do
      it 'updates the author' do
        patch :update, params: { id: author.to_param, author: valid_attributes }
        author.reload
        expect(author.first_name).to eq('John')
      end

      it 'redirects to authors index' do
        patch :update, params: { id: author.to_param, author: valid_attributes }
        expect(response).to redirect_to(authors_url)
      end
    end

    context 'with invalid params' do
      it 'does not update the author' do
        patch :update, params: { id: author.to_param, author: invalid_attributes }
        author.reload
        expect(author.first_name).not_to be_nil
      end

      it 'redirects to edit_book_url with an error message' do
        patch :update, params: { id: author.to_param, author: invalid_attributes }
        expect(response).to redirect_to(edit_book_url)
        expect(flash[:notice]).to include("First name can't be blank")
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:author) { FactoryBot.create(:author) }

    it 'destroys the author' do
      expect do
        delete :destroy, params: { id: author.to_param }
      end.to change(Author, :count).by(-1)
    end

    it 'redirects to authors index' do
      delete :destroy, params: { id: author.to_param }
      expect(response).to redirect_to(authors_url)
    end

    it 'sets a flash notice' do
      delete :destroy, params: { id: author.to_param }
      expect(flash[:notice]).to eq('Article was successfully destroyed.')
    end
  end
end
