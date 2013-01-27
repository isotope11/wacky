class AcceptanceSpec
  def page_title
    first('head title').native.text
  end
end
