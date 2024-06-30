class Cookie

    INGREDIENT_RE = /(\w+): capacity (-?\d+), durability (-?\d+), flavor (-?\d+), texture (-?\d+), calories (-?\d+)/
    TOTAL_TEASPOONS = 100

    def initialize(ingredients, limit = 0)
        @ingredients = ingredients.split("\n").map { |ingredient| get_ingredient(ingredient) }
        @limit = limit
        @highest_score = 0
    end

    def make
        return 0 if @ingredients.empty?
        return get_score([TOTAL_TEASPOONS]) if @ingredients.length == 1

        cal(TOTAL_TEASPOONS, [])

        @highest_score
    end

    private

    def cal(left, picks)

        if picks.length >= @ingredients.length-1
            new_picks = picks.dup.push(left)
            @highest_score = [@highest_score, get_score(new_picks)].max
            return
        end

        (0..left).each do |i|
            picks.push(i)
            cal(left-i, picks)
            picks.pop
        end
    end

    def get_score(picks)
        return 0 if @limit > 0 && cal_ingre_score(:calories, picks) != @limit

        [:capacity, :durability, :flavor, :texture].map do |key|
            cal_ingre_score(key, picks)
        end.inject(:*)
    end

    def cal_ingre_score(key, picks)
        score = @ingredients.map.each_with_index do |ingre, i|
            ingre[key] * picks[i]
        end.sum
        return 0 if score < 0
        score
    end

    def get_ingredient(ingredient)
        md = INGREDIENT_RE.match(ingredient)
        {
            name: md[1],
            capacity: md[2].to_i,
            durability: md[3].to_i,
            flavor: md[4].to_i,
            texture: md[5].to_i,
            calories: md[6].to_i,
        }
    end
end
