Card = Struct.new :suit, :rank, :face_down do
  def initialize(*)
    super
    self.face_down ||= false
  end
end