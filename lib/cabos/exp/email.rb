module Cabos::Exp
  class Email < ::Cabos::Base
    label :email
    regexp /\A[^@\s]+@[^@\s]+\z/
  end
end
