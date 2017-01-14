class ChainableHash < Hash
  def method_missing(name, *args, &block)  
    if name[-1] === '='
      self[name[0..-2].to_sym] = args.first
    elsif self.has_key?(name.to_sym)
      self[name.to_sym]
    else
      self[name.to_sym] = self.class.new
    end  
  end  
end

