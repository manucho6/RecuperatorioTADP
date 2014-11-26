require 'rspec'
require_relative '../src/Dependencias'

class Viaje
  attr_accessor :origen, :destino, :peso
  def costo
    costo= 5* self.distanciador.calcular_entre(self.origen,self.destino)
    costo + self.tarifa_por_peso * self.peso
  end
end

class DistanciadorReal
  def calcular_entre(origen,destino)
    destino - origen
  end
end
describe 'creo dependencias' do

  it 'should crear dependencia para tarifa_por_peso' do
    Dependencia.agregar {
      para_clase(Viaje)
      nombre(:distanciador)
      objeto(DistanciadorReal.new)
    }
    Dependencia.agregar {
      para_clase(Viaje)
      nombre(:tarifa_por_peso)
      objeto(42)
    }
    viaje=Viaje.new

    expect(viaje.tarifa_por_peso).to eq(42)

  end
  it 'should crear dependencia para distanciador' do
    Dependencia.agregar {
      para_clase(Viaje)
      nombre(:distanciador)
      objeto(DistanciadorReal.new)
    }

    viaje=Viaje.new

    expect(viaje.distanciador.calcular_entre(2,3)).to eq(1)

  end
end