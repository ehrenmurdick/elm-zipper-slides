def init
  @sildes = [
    { title: "first" },
    { title: "second" },
    ...
  ]
  @current_index = 4
end

def next
  if @current_index < @slides.length - 1
    @current_index = @current_index + 1
  end
end

def update_current_slide_title(new_title)
  @slides[@current_index]["title"] = new_title
end
