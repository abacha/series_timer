class Episode < Struct.new(:serie, :season, :number_raw, :title, :date_raw)

  def date
    @date ||= Date.parse date_raw
  end

  def countdown
    "#{(date - Date.today).to_i} days"
  end

  def number
    @number ||= number_raw.to_i
  end

  def empty?
    number_raw.nil?
  end

end
