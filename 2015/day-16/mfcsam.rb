class MFCSAM

    def initialize(sues_comps, ticker_tape)
        @sues_list = get_sues_info(sues_comps)
        @tape_list = compounds(ticker_tape.split("\n"))
    end

    def find
        sues = @sues_list.dup
        @tape_list.each do |comp, comp_value|
            sues = sues.reject do |sue|
                true if !sue[comp].nil? && sue[comp] != comp_value
            end
        end
        return -1 if sues.empty?
        sues[0][:sue_id]
    end

    private

    def get_sues_info(sues_comps)
        sues_comps.split("\n").map do |sue|
            i = sue.index(":")
            sue_id = sue[0, i].delete_prefix("Sue").to_i
            compounds(sue[i+1..].split(","), {sue_id: sue_id})
        end
    end

    def compounds(comp_list, source={})
        comp_list.each_with_object(source) do |i, a|
            key, value = i.split(":")
            a[key.strip] = value.to_i
        end
    end

end
