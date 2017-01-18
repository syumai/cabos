module Cabos::Exp
  class Integer < ::Cabos::Base
    label :integer
    aliases [:int]
    test do
      true if ::Integer(self) rescue false
    end
  end
 
  class Float < ::Cabos::Base
    label :float
    test do
      true if ::Float(self) rescue false
    end
  end
end
