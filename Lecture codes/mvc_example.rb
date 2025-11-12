# ===== Model =====
class TodoList
  def initialize = @items = []
  def add(text)  = @items << text
  def remove(i)  = @items.delete_at(i)
  def items      = @items
end

# ===== Views =====
class View
  def render(items); end
end

class ListView < View
  def render(items)
    (["Todos:"] +
     items.each_with_index.map { |t, i| "#{i}. #{t}" }).join("\n")
  end
end

class SummaryView < View
  def render(items)
    "Total: #{items.size} | Next: #{items.first || '-'}"
  end
end

# ===== Controller =====
class ListController
  def initialize(model, *views)
    @model = model
    @views = views
  end

  def add_view(view) = @views << view
  def add(text)      = @model.add(text)
  def remove(index)  = @model.remove(index)

  def show_all
    @views.each do |v|
      puts v.render(@model.items)
      puts
    end
  end
end

# ===== Demo =====
m = TodoList.new
v1 = ListView.new
v2 = SummaryView.new
c  = ListController.new(m, v1, v2)

c.add("conquer the world")
c.add("profit")
c.show_all # controller forces all registered views to show

c.remove(0)
c.show_all # controller triggers views. both views show updated state.

