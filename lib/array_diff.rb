class ArrayDiff
  def exec(a, b)
    raise "Expected array, instead recieved #{a}" unless a.kind_of?(Array)
    raise "Expected array, instead recieved #{b}" unless b.kind_of?(Array)
    return [] if (a.empty? && b.empty?)
    res = []
    if a.length < b.length
      temp = a
      a = b
      b = temp
    end
    a.each do |val|
      res.push(val) unless b.include?(val)
    end
    return res
  end
end
