require 'test_helper'

class TypesControllerTest < ActionController::TestCase
  setup do
    @type = types(:monumento)   # Carga de fixtures site.yml, entrada :one
    @type2 = types(:monumento2)
	  @update = {           # Añadido: creamos un hash de parametros distintos
      :name         => 'AnotherType',
      :description  => 'AnotherText',
    }

  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type" do
    assert_difference('Type.count') do
      post :create, :type => @update      # Se cambia por @update
    end

    assert_redirected_to type_path(assigns(:type))
  end
  
  # Prueba que no se pueden introducir dos tipos con el mismo nombre
  test "should not create type with same name" do
    post :create, :type => @type
    post :create, :type => @type2
    @type2.save
    assert @type2.invalid?
  end

  test "should show type" do
    get :show, :id => @type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @type.to_param
    assert_response :success
  end

  test "should update type" do
    put :update, :id => @type.to_param, :type => @update      # Se cambia por @update
    assert_redirected_to type_path(assigns(:type))
  end

  test "should destroy type" do
    assert_difference('Type.count', -1) do
      delete :destroy, :id => @type.to_param
    end

    assert_redirected_to types_path
  end
end
