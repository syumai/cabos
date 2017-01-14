module Cabos::Exp
  module Email
    include ::Cabos::Base
    label :email
    regexp /\A[^@\s]+@[^@\s]+\z/
  end
end
