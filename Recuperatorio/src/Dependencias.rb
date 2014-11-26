class Dependencia

  def para_clase target_class
    @class=target_class
  end

  def nombre symbol
    @selector= symbol
  end

  def objeto object
    @class.send(:define_method, @selector) do
      object
    end
  end

  def self.agregar &block
    dependencia= Dependencia.new
    dependencia.instance_eval &block

  end

  def self.entorno ambiente
    @entorno=ambiente
  end

  def entorno unAmbiente

  end
end