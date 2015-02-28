module ApplicationHelper
	def inline_error(obj, attrib)
		obj.errors[attrib].to_sentence
	end

  def setup_obj(obj, attrib)
    obj.send(attrib) || obj.send("build_#{attrib.to_s}")
  end
end
