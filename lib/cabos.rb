require_relative './cabos/utils'

module Cabos
  class << self
    def expressions
      Exp.constants.map{|exp| Exp.const_get(exp)}
    end

    def patch
      expressions.each do |exp|
        exp.apply
      end
    end

    def config
      @config ||= ChainableHash.new
    end
  end
end

require_relative './cabos/base.rb'

exp_path = File.join(File.dirname(__FILE__), 'cabos', 'exp', '*.rb')
Dir[exp_path].each {|file| require file }

Cabos.patch
