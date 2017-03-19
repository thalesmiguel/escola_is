require 'rails_helper'
RSpec.describe EstudantesController, type: :controller do

  let(:dados_validos) { FactoryGirl.attributes_for(:estudante) }
  let(:dados_invalidos) { FactoryGirl.attributes_for(:estudante, nome: '') }

  describe "GET #index" do
    it "Atribui todos os estudates à @estudantes" do
      estudante = Estudante.create! dados_validos
      get :index, params: {}
      expect(assigns(:estudantes)).to eq [estudante]
    end
  end

  describe "GET #show" do
    it "Atribui o estudante selecionado à @estudante" do
      estudante = Estudante.create! dados_validos
      get :show, params: { id: estudante }
      expect(assigns(:estudante)).to eq estudante
    end
  end

  describe "GET #new" do
    it "Atribui um NOVO estudante à @estudante" do
      get :new, params: {}
      expect(assigns(:estudante)).to be_a_new Estudante
    end
  end

  describe "GET #edit" do
    it "Atribui o estudante selecionado à @estudante" do
      estudante = Estudante.create! dados_validos
      get :edit, params: { id: estudante }
      expect(assigns(:estudante)).to eq estudante
    end
  end

  describe "POST #create" do
    context "com parâmetros válidos" do
      it "cria um NOVO Estudante" do
        expect {
          post :create, params: { estudante: dados_validos }
        }.to change(Estudante, :count).by 1
      end

      it "atribui o NOVO estudante criado à @estudante" do
        post :create, params: { estudante: dados_validos }
        expect(assigns(:estudante)).to be_a Estudante
        expect(assigns(:estudante)).to be_persisted
      end

      it "redireciona para o novo Estudante" do
        post :create, params: { estudante: dados_validos }
        expect(response).to redirect_to Estudante.last
      end
    end

    context "com parâmetros inválidos" do
      it "atribui o NOVO Estudante à @estudante mas não o persiste no banco de dados" do
        post :create, params: { estudante: dados_invalidos }
        expect(assigns(:estudante)).to be_a_new Estudante
      end

      it "renderiza o template :new" do
        post :create, params: {estudante: dados_invalidos}
        expect(response).to render_template "new"
      end
    end
  end

  describe "PUT #update" do
    context "com parâmetros válidos" do
      let(:novos_atributos) { FactoryGirl.attributes_for(:estudante) }

      it "updates the requested estudante" do
        estudante = Estudante.create! dados_validos
        put :update, params: { id: estudante, estudante: novos_atributos }
        estudante.reload
        expect(estudante.nome).to eq novos_atributos[:nome]
      end

      it "atribui o estudante selecionado à @estudante" do
        estudante = Estudante.create! dados_validos
        put :update, params: { id: estudante, estudante: dados_validos }
        expect(assigns(:estudante)).to eq estudante
      end

      it "redireciona para o estudante" do
        estudante = Estudante.create! dados_validos
        put :update, params: { id: estudante, estudante: dados_validos }
        expect(response).to redirect_to estudante
      end
    end

    context "com parâmetros inválidos" do
      it "atribui o estudante à @estudante" do
        estudante = Estudante.create! dados_validos
        put :update, params: { id: estudante, estudante: dados_invalidos }
        expect(assigns(:estudante)).to eq estudante
      end

      it "renderiza o template :edit" do
        estudante = Estudante.create! dados_validos
        put :update, params: { id: estudante, estudante: dados_invalidos }
        expect(response).to render_template "edit"
      end
    end
  end

  describe "DELETE #destroy" do
    it "exclui o estudante selecionado" do
      estudante = Estudante.create! dados_validos
      expect {
        delete :destroy, params: { id: estudante }
      }.to change(Estudante, :count).by(-1)
    end

    it "redireciona à lista de estudantes" do
      estudante = Estudante.create! dados_validos
      delete :destroy, params: { id: estudante }
      expect(response).to redirect_to estudantes_url
    end
  end

end
