module ApplicationHelper
  def flash_message_classes_for_alert_level(value)
    case value
    when 'notice' then "blue bg-washed-blue"
    when 'success' then "green bg-washed-green"
    when 'error' then "red bg-washed-red"
    when 'alert' then "gold bg-washed-yellow"
    end
  end
end
