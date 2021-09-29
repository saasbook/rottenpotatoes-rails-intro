module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  
  def highlight_if_current_column(column)
    params[:sort_by] == column.to_s ? 'hilite' : nil
  end
end
