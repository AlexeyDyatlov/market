class Disk < Product
  attr_accessor :artist, :genre, :year

  def initialize(options)
    super
    @artist = options[:artist]
    @genre = options[:genre]
    @year = options[:year]
  end

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp }
    self.new(
        title: lines[0],
        artist: lines[1],
        genre: lines[2],
        year: lines[3],
        price: lines[4].to_i,
        balance: lines[5].to_i
    )
  end

  def output
    "Альбом #{@artist} — \'#{@title}', #{@genre}, #{@year}, #{super}"
  end

  def update(options)
      super
      @artist = options[:artist] if options[:artist]
      @year = options[:year] if options[:year]
      @genre = options[:genre] if options[:genre]
  end
end
