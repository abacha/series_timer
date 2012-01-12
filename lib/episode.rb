class Episode < Struct.new(:serie, :number_raw, :title, :date_raw)

  def date
    @date ||= Date.parse date_raw
  end

  def number
    @number ||= number_raw.to_i
  end

  def empty?
    number_raw.nil?
  end

end

