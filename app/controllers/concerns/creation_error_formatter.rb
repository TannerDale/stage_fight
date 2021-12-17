module CreationErrorFormatter
  def format_errors(obj)
    "#{object_errors(obj)}. Please try again."
  end

  private

  def object_errors(obj)
    obj.errors.full_messages.to_sentence
  end
end
