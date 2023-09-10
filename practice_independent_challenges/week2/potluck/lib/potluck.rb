class Potluck
    attr_reader :date,
                :dishes

    def initialize(date)
        @date = date
        @dishes = []
    end

    def add_dish(dish)
        @dishes << dish
    end

    def get_all_from_category(category)
        @dishes.map do |dish|
            dish if dish.category == category
        end.compact
    end

    def menu_categories
        @dishes.map do |dish|
            dish.category
        end.uniq
    end

    def menu
        unsorted_menu = {}
        @dishes.each do |dish| 
            unsorted_menu[dish.category] ||= []
            unsorted_menu[dish.category] << dish.name
        end
        menu = {}
        unsorted_menu.each do |category, dishes|
            menu[category] = dishes.sort
        end
        menu
    end

    def ratio(category)
        total_dish_count = @dishes.count.to_f
        category_dish_count = get_all_from_category(category).count.to_f
        (category_dish_count / total_dish_count) * 100
    end
end