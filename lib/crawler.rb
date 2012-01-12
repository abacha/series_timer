class Crawler

  REGEX_EPISODES = 
    Regexp.new(/<td>(\d+)<\/td>.*?<td class="summary" [^>]+>(?:"<b>)?(?:<a [^>]+>)?([\w\s]*)(?:<\/a>)?(?:<\/b>")?.*?<span[^>]+>([0-9-]+)<\/span>/m)

  def parse_episodes(serie)
    renamed_serie = serie.gsub(" ", "_")
    episodes = []
    get(renamed_serie).scan(REGEX_EPISODES) do |e| 
      episodes << Episode.new(serie, *e) 
    end
    episodes
  end

  private
  def get(serie)
    File.exists?(get_cache_file(serie)) ? cache(serie) : web(serie)
  end

  def get_cache_file(serie)
    Dir.mkdir("/tmp/cache") if !File.directory?("/tmp/cache/")
    "/tmp/cache/" + serie + ".cache"
  end

  def web(serie)
    raw = Net::HTTP.get("en.wikipedia.org", 
                        "/wiki/List_of_" + serie + "_episodes")
    File.open(get_cache_file(serie), 'w') { |f| f.write(raw) }
    raw
  end

  def cache(serie)
    File.open(get_cache_file(serie), "r").read
  end

end
