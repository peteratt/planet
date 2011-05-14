require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
#  test "the truth" do
#    assert true
#  end
  
  # type creado sin atributos es invalido y genera errores
  test "Type attributes must not be empty" do
    type = Type.new
    assert type.invalid? # Test pasa si validación no pasa
    assert type.errors[:name].any?
    assert type.errors[:description].any?
  end
  
  test "Type name must not be the same" do
    monumento = types(:monumento)
    naturaleza = types(:naturaleza)
    
    naturaleza2 = types(:naturaleza)
    assert monumento.valid?
    assert naturaleza.valid?
    assert naturaleza2.invalid?
  end
end
