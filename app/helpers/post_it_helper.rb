module PostItHelper

  def post_it_json(note)
    {
      x: note.post_it_x,
      y: note.post_it_y,
      angle: note.post_it_angle,
      flipped: note.post_it_flipped,
      update_url: note_path(note)
    }.to_json
  end

end
