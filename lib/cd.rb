class CD
  attr_reader(:artist, :album)
    @@organizer = []

  def initialize(attributes)
    @artist = attributes[:artist]
    @album = attributes[:album]
  end

  def CD.all
    @@organizer
end
