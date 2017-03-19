require 'rails_helper'
RSpec.describe CursosController, type: :controller do

  let(:dados_validos) { FactoryGirl.attributes_for(:curso) }
  let(:dados_invalidos) { FactoryGirl.attributes_for(:curso, nome: '') }

  describe "GET #index" do
    it "Atribui todos os estudates à @cursos" do
      curso = Curso.create! dados_validos
      get :index, params: {}
      expect(assigns(:cursos)).to eq [curso]
    end
  end

  describe "GET #show" do
    it "Atribui o curso selecionado à @curso" do
      curso = Curso.create! dados_validos
      get :show, params: { id: curso }
      expect(assigns(:curso)).to eq curso
    end
  end

  describe "GET #new" do
    it "Atribui um NOVO curso à @curso" do
      get :new, params: {}
      expect(assigns(:curso)).to be_a_new Curso
    end
  end

  describe "GET #edit" do
    it "Atribui o curso selecionado à @curso" do
      curso = Curso.create! dados_validos
      get :edit, params: { id: curso }
      expect(assigns(:curso)).to eq curso
    end
  end

  describe "POST #create" do
    context "com parâmetros válidos" do
      it "cria um NOVO Curso" do
        expect {
          post :create, params: { curso: dados_validos }
        }.to change(Curso, :count).by 1
      end

      it "atribui o NOVO curso criado à @curso" do
        post :create, params: { curso: dados_validos }
        expect(assigns(:curso)).to be_a Curso
        expect(assigns(:curso)).to be_persisted
      end

      it "redireciona para o novo Curso" do
        post :create, params: { curso: dados_validos }
        expect(response).to redirect_to Curso.last
      end
    end

    context "com parâmetros inválidos" do
      it "atribui o NOVO Curso à @curso mas não o persiste no banco de dados" do
        post :create, params: { curso: dados_invalidos }
        expect(assigns(:curso)).to be_a_new Curso
      end

      it "renderiza o template :new" do
        post :create, params: {curso: dados_invalidos}
        expect(response).to render_template "new"
      end
    end
  end

  describe "PUT #update" do
    context "com parâmetros válidos" do
      let(:novos_atributos) { FactoryGirl.attributes_for(:curso) }

      it "updates the requested curso" do
        curso = Curso.create! dados_validos
        put :update, params: { id: curso, curso: novos_atributos }
        curso.reload
        expect(curso.nome).to eq novos_atributos[:nome]
      end

      it "atribui o curso selecionado à @curso" do
        curso = Curso.create! dados_validos
        put :update, params: { id: curso, curso: dados_validos }
        expect(assigns(:curso)).to eq curso
      end

      it "redireciona para o curso" do
        curso = Curso.create! dados_validos
        put :update, params: { id: curso, curso: dados_validos }
        expect(response).to redirect_to curso
      end
    end

    context "com parâmetros inválidos" do
      it "atribui o curso à @curso" do
        curso = Curso.create! dados_validos
        put :update, params: { id: curso, curso: dados_invalidos }
        expect(assigns(:curso)).to eq curso
      end

      it "renderiza o template :edit" do
        curso = Curso.create! dados_validos
        put :update, params: { id: curso, curso: dados_invalidos }
        expect(response).to render_template "edit"
      end
    end
  end

  describe "DELETE #destroy" do
    it "exclui o curso selecionado" do
      curso = Curso.create! dados_validos
      expect {
        delete :destroy, params: { id: curso }
      }.to change(Curso, :count).by(-1)
    end

    it "redireciona à lista de cursos" do
      curso = Curso.create! dados_validos
      delete :destroy, params: { id: curso }
      expect(response).to redirect_to cursos_url
    end
  end

end
