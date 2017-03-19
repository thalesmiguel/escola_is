require 'rails_helper'
RSpec.describe MatriculasController, type: :controller do

  let(:curso) { FactoryGirl.create(:curso) }
  let(:estudante) { FactoryGirl.create(:estudante) }
  let(:dados_validos) { FactoryGirl.attributes_for(:matricula, curso: curso, estudante: estudante) }
  let(:dados_invalidos) { FactoryGirl.attributes_for(:matricula, curso: curso, estudante: estudante, nome: '') }

  describe "GET #index" do
    it "Atribui todos os estudates à @matriculas" do
      matricula = Matricula.create! dados_validos
      get :index, params: {}
      expect(assigns(:matriculas)).to eq [matricula]
    end
  end

  describe "GET #show" do
    it "Atribui o matricula selecionado à @matricula" do
      matricula = Matricula.create! dados_validos
      get :show, params: { id: matricula }
      expect(assigns(:matricula)).to eq matricula
    end
  end

  describe "GET #new" do
    it "Atribui um NOVO matricula à @matricula" do
      get :new, params: {}
      expect(assigns(:matricula)).to be_a_new Matricula
    end
  end

  describe "GET #edit" do
    it "Atribui o matricula selecionado à @matricula" do
      matricula = Matricula.create! dados_validos
      get :edit, params: { id: matricula }
      expect(assigns(:matricula)).to eq matricula
    end
  end

  describe "POST #create" do
  let(:dados_validos) { FactoryGirl.attributes_for(:matricula, curso_id: curso, estudante_id: estudante) }
    context "com parâmetros válidos" do
      it "cria um NOVO Matricula" do
        expect {
          post :create, params: { matricula: dados_validos }
        }.to change(Matricula, :count).by 1
      end

      it "atribui o NOVO matricula criado à @matricula" do
        post :create, params: { matricula: dados_validos }
        expect(assigns(:matricula)).to be_a Matricula
        expect(assigns(:matricula)).to be_persisted
      end

      it "redireciona para o novo Matricula" do
        post :create, params: { matricula: dados_validos }
        expect(response).to redirect_to Matricula.last
      end
    end

    context "com parâmetros inválidos" do
      it "atribui o NOVO Matricula à @matricula mas não o persiste no banco de dados" do
        post :create, params: { matricula: dados_invalidos }
        expect(assigns(:matricula)).to be_a_new Matricula
      end

      it "renderiza o template :new" do
        post :create, params: {matricula: dados_invalidos}
        expect(response).to render_template "new"
      end
    end
  end

  describe "PUT #update" do
    context "com parâmetros válidos" do
      let(:novos_atributos) { FactoryGirl.attributes_for(:matricula, curso: curso, estudante: estudante) }

      it "updates the requested matricula" do
        matricula = Matricula.create! dados_validos
        put :update, params: { id: matricula, matricula: novos_atributos }
        matricula.reload
        expect(matricula.curso).to eq novos_atributos[:curso]
      end

      it "atribui o matricula selecionado à @matricula" do
        matricula = Matricula.create! dados_validos
        put :update, params: { id: matricula, matricula: dados_validos }
        expect(assigns(:matricula)).to eq matricula
      end

      it "redireciona para o matricula" do
        matricula = Matricula.create! dados_validos
        put :update, params: { id: matricula, matricula: dados_validos }
        expect(response).to redirect_to matricula
      end
    end

    context "com parâmetros inválidos" do
      it "atribui o matricula à @matricula" do
        matricula = Matricula.create! dados_validos
        put :update, params: { id: matricula, matricula: dados_invalidos }
        expect(assigns(:matricula)).to eq matricula
      end
    end
  end

  describe "DELETE #destroy" do
    it "exclui o matricula selecionado" do
      matricula = Matricula.create! dados_validos
      expect {
        delete :destroy, params: { id: matricula }
      }.to change(Matricula, :count).by(-1)
    end

    it "redireciona à lista de matriculas" do
      matricula = Matricula.create! dados_validos
      delete :destroy, params: { id: matricula }
      expect(response).to redirect_to matriculas_url
    end
  end

end
