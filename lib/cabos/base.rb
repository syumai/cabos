module Cabos
  class Base
    def self.inherited(exp)
      class << exp
        def apply
          _label, _regexp, _test = label, regexp, test
          ::String.module_eval do |str|
            define_method "#{_label}?" do
              if _regexp
                self.class.method_defined?(:match?) ? 
                  match?(_regexp) :
                  !!match(_regexp)
              elsif _test
                _test.call
              end
            end
          end
        end

        private

          def label(n = nil)
            if n
              @name = n.to_s
            else
              @name
            end
          end

          def regexp(r = nil)
            if r
              @regexp = r
            else
              @regexp
            end
          end

          def test(&t)
            if block_given?
              @test = t
            else
              @test
            end
          end

          def config
            ::Cabos.config
          end
      end
    end
  end
end
