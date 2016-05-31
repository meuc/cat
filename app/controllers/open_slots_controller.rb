class OpenSlotsController < ApplicationController
  # Render currect available timeslots according to chosen cat and day
  def show
    cat = Cat.find(params[:cat_id])
    date = Date.parse(params[:date])
    slots = cat.open_slots_for_select(date)
    html = view_context.options_for_select(slots)
    
    render html: html
  end
end