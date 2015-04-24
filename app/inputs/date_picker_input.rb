class DatePickerInput < SimpleForm::Inputs::StringInput
  def input_html_options
    value = object.send(attribute_name)
    options = {
      value: value.nil?? nil : I18n.localize(value),
      data: { behaviour: 'date_picker' }  # for example
    }
    # add all html option you need...
    super.merge options
  end
end
