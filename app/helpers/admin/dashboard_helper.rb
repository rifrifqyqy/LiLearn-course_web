module Admin::DashboardHelper
  def active_class(button_id)
    params[:button_id] == button_id ? 'bg-amber-500 text-white hover:bg-amber-500/80' : ''
  end

  def button_classes
    "py-3 rounded-xl font-semibold  transition-all flex gap-4 items-center px-4"
  end

  # agar text zinc tidak tertimpa dan terbaca zinc saja
  def full_button_classes(button_id)
    base_classes = button_classes
    active_classes = active_class(button_id)

    if active_classes.present?
      "#{base_classes} #{active_classes}".strip
    else
      "#{base_classes} text-zinc-600 hover:bg-zinc-200".strip
    end
  end
end
