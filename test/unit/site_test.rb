require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  # Replace this with your real tests.
#  test "the truth" do
#    assert true
#  end

  # site creado sin atributos es invalido y genera errores
  test "Site attributes must not be empty" do
    site = Site.new
    assert site.invalid? # Test pasa si validación no pasa
    assert site.errors[:name].any?
    assert site.errors[:description].any?
    assert site.errors[:type_id].any?
    assert site.errors[:latitude].any?
    assert site.errors[:longitude].any?
    assert site.errors[:zoom].any?
    assert site.errors[:image_url].any?
  end
  
  test "zoom must be greater than 0" do
    site = Site.new( 
      :name => 'AnotherSite',
      :description => 'AnotherText',
      :type_id => 1,
      :latitude => 9,
      :longitude => 9,
      :zoom => 1,
      :image_url => 'MySite.png'
    )
    
    site.zoom = -1
    assert site.invalid? # Test pasa, si atributo incorrecto
    site.zoom = 0
    assert site.invalid? # Test pasa, si atributo incorrecto
    site.zoom = 1
    assert site.valid? # Test pasa, si atributo correcto
  end
  
  test "Site name must not be the same" do
    teleco = sites(:teleco)
    chicago = sites(:chicago)
    
    chicago2 = sites(:chicago)
    assert teleco.valid?
    assert chicago.valid?
    assert chicago2.invalid?
  end
  
end
