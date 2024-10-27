module RailsButtonHelper
  # here contain all button components variants
  # CUSTOMIZING
  # btn_class for customizing
  # color for coloring rules
  # padding for padding



  def railsbutton_primary(text = "Primary Button", url = "#", color: "bg-zinc-800 text-white", padding: "px-4 py-2", btn_class: nil, icon: false)
    base_class = "font-medium flex items-center justify-between gap-2 hover:opacity-75 transition-all rounded-full w-fit active:scale-95"
    # Merge class variable
    full_class = "#{color} #{padding} #{base_class} #{btn_class}"
    
    # Render button with optional icon
    if icon.present?
      icon_html = content_tag(:span, class: "items-center") do
        # Menggunakan raw untuk menampilkan HTML jika icon adalah string HTML
        raw(icon)
      end
      link_to "#{text}#{icon_html}".html_safe, url, class: full_class.strip
    else
      link_to text, url, class: full_class.strip
    end
  end
  

  def railsbutton_secondary(text = "Secondary Button", url = "#", color: "bg-zinc-200 text-zinc-800", padding: "px-4 py-2", btn_class: nil)
    base_class = "font-medium hover:opacity-75 transition-all rounded-full w-fit active:scale-95"
    full_class = "#{color} #{padding} #{base_class} #{btn_class}"
    link_to text, url, class: full_class.strip
  end
  def railsbutton_outline(text = "Outline Button", url = "#", color: "border-2 border-zinc-800", padding: "px-4 py-2", btn_class: nil)
    base_class = "font-medium hover:opacity-75 transition-all rounded-full w-fit active:scale-95"
    full_class = "#{color} #{padding} #{base_class} #{btn_class}"
    link_to text, url, class: full_class.strip
  end
  
  
end
