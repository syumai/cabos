module Cabos
  module Base
    def self.included(exp)
      class << exp
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
        def apply
          exp = self
          ::String.module_eval do |str|
            define_method "#{exp.label}?" do
              if exp.regexp
                self.class.method_defined?(:match?) ? 
                  match?(exp.regexp) :
                  !!match(exp.regexp)
              elsif exp.test
                exp.test
              end
            end
          end
        end
      end
    end
  end
end
