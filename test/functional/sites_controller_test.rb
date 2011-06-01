require 'test_helper'

class SitesControllerTest < ActionController::TestCase
  setup do
    @site = sites(:teleco)
    @site2 = sites(:teleco2)
    
    @update = { # Añadimos @update - objeto con parametros diferentes
      :name => 'AnotherSite',
      :description => 'AnotherText',
      :type_id => 1,
      :latitude => 9,
      :longitude => 9,
      :zoom => 1,
      :image_url => 'MySite.png'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site" do
    assert_difference('Site.count') do
      post :create, :site => @update
    end

    assert_redirected_to site_path(assigns(:site))
  end
  
  # Prueba que no se pueden introducir dos sitios con el mismo nombre
  test "should not create site with same name" do
    post :create, :site => @site
    post :create, :site => @site2
    @site2.save
    assert @site2.invalid?
  end

  test "should show site" do
    # Comprueba que se actualizan las visitas en 1
    assert_difference('@site.visits', 1) do
      get :show, :id => @site.to_param
      @site.reload
    end
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @site.to_param
    assert_response :success
  end

  test "should update site" do
    put :update, :id => @site.to_param, :site => @update
    assert_redirected_to site_path(assigns(:site))
  end

  test "should destroy site" do
    assert_difference('Site.count', -1) do
      delete :destroy, :id => @site.to_param
    end

    assert_redirected_to sites_path
  end
end
