
class Assembly

    def self.provided_to(circuit, target)
        return nil if circuit.nil? || circuit.empty?

        circuit_obj = get_relation(circuit)
        cal_signal(circuit_obj, target) & 65535
    end

    def self.provided_to_part2(circuit, target)
        return nil if circuit.nil? || circuit.empty?

        circuit_obj = get_relation(circuit)
        circuit_obj["b"] = provided_to(circuit, target).to_s

        cal_signal(circuit_obj, target) & 65535
    end

    private

    def self.get_relation(circuit)
        circuit_obj = {}
        circuit.split("\n").each do |i|
            from, to = i.split("->")
            circuit_obj[to.strip] = from.strip
        end
        circuit_obj
    end

    def self.cal_signal(circuit_obj, target)
        return target.to_i if is_numeric?(target)
        return nil if circuit_obj[target].nil?

        sub_circuit = circuit_obj[target]

        if sub_circuit.include?("AND")
            s1, s2 = sub_circuit.split("AND")
            r1 = cal_signal(circuit_obj, s1.strip)
            r2 = cal_signal(circuit_obj, s2.strip)
            result = r1 & r2
        elsif sub_circuit.include?("OR")
            s1, s2 = sub_circuit.split("OR")
            result = cal_signal(circuit_obj, s1.strip) | cal_signal(circuit_obj, s2.strip)
        elsif sub_circuit.include?("NOT")
            n1 = sub_circuit.delete_prefix("NOT")
            result = ~cal_signal(circuit_obj, n1.strip)
        elsif sub_circuit.include?("LSHIFT")
            m1, move_value = sub_circuit.split("LSHIFT")
            result = cal_signal(circuit_obj, m1.strip) << move_value.to_i
        elsif sub_circuit.include?("RSHIFT")
            m1, move_value = sub_circuit.split("RSHIFT")
            result = cal_signal(circuit_obj, m1.strip) >> move_value.to_i
        else
            if is_numeric?(sub_circuit)
                result = sub_circuit.to_i
            else
                result = cal_signal(circuit_obj, sub_circuit)
            end
        end

        circuit_obj[target] = result.to_s
        result
    end

    def self.is_numeric?(str)
      true if Integer(str)
    rescue ArgumentError
      false
    end

end
