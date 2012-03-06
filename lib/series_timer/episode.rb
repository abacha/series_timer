module SeriesTimer
  class Episode < Struct.new(:serie, :season, :number_raw, :title, :date_raw)

    def date
      @date ||= Date.parse date_raw
    end

    def diffdays
      days = (date - Date.today).to_i
      "#{days.abs} days#{days < 0 ? ' ago':''}"
    end

    def number
      @number ||= number_raw.to_i
    end

    def empty?
      number_raw.nil?
    end
  
    def to_s
      "[#{serie}] S%02de%02d\t #{title}\t #{date}"  % [ season, number ]
    end

  end
end
