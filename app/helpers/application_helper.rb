# encoding: utf-8

module ApplicationHelper
  # flash message class
  def gritter_class_for(flash_type)
    case flash_type
    when 'success'
      'gritter-flash flash-success'
    when 'alert', 'danger', 'error', 'validation_errors'
      'gritter-flash flash-danger'
    when 'notice', 'info'
      'gritter-flash flash-info'
    when 'warning'
      'gritter-flash flash-warning'
    else
      flash_type.to_s
    end
  end
end
