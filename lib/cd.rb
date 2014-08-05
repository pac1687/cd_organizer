class CD
  attr_reader(:artist, :album)
  @@organizer = []

  def CD.all
    @@organizer
  end

  def initialize(attributes)
    @artist = attributes[:artist]
    @album = attributes[:album]
  end

  def cd_add
    @@organizer << self
  end
end

