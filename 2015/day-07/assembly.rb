
class Assembly

    def self.provided_to(circuit, target)
        return nil if circuit.nil? || circuit.empty?

        circuit_obj = get_relation(circuit)
        format16bit cal_signal(circuit_obj, target)
    end

    def self.provided_to_part2(circuit, target)
        return nil if circuit.nil? || circuit.empty?

        circuit_obj = get_relation(circuit)
        circuit_obj["b"] = provided_to(circuit, target).to_s

        format16bit cal_signal(circuit_obj, target)
    end

    private

    def self.format16bit(v)
        v & 65535
    end

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
            result = self.and(circuit_obj, sub_circuit)
        elsif sub_circuit.include?("OR")
            result = self.or(circuit_obj, sub_circuit)
        elsif sub_circuit.include?("NOT")
            result = self.not(circuit_obj, sub_circuit)
        elsif sub_circuit.include?("LSHIFT")
            result = self.left_shift(circuit_obj, sub_circuit)
        elsif sub_circuit.include?("RSHIFT")
            result = self.right_shift(circuit_obj, sub_circuit)
        else
            result = self.other(circuit_obj, sub_circuit)
        end

        circuit_obj[target] = result.to_s
        result
    end

    def self.other(circuit_obj, sub_circuit)
        if is_numeric?(sub_circuit)
            sub_circuit.to_i
        else
            cal_signal(circuit_obj, sub_circuit)
        end
    end

    def self.right_shift(circuit_obj, sub_circuit)
        m1, move_value = sub_circuit.split("RSHIFT")
        cal_signal(circuit_obj, m1.strip) >> move_value.to_i
    end

    def self.left_shift(circuit_obj, sub_circuit)
        m1, move_value = sub_circuit.split("LSHIFT")
        cal_signal(circuit_obj, m1.strip) << move_value.to_i
    end

    def self.not(circuit_obj, sub_circuit)
        n1 = sub_circuit.delete_prefix("NOT")
        ~cal_signal(circuit_obj, n1.strip)
    end

    def self.or(circuit_obj, sub_circuit)
        s1, s2 = sub_circuit.split("OR")
        cal_signal(circuit_obj, s1.strip) | cal_signal(circuit_obj, s2.strip)
    end

    def self.and(circuit_obj, sub_circuit)
        s1, s2 = sub_circuit.split("AND")
        r1 = cal_signal(circuit_obj, s1.strip)
        r2 = cal_signal(circuit_obj, s2.strip)
        r1 & r2
    end

    def self.is_numeric?(str)
      true if Integer(str)
    rescue ArgumentError
      false
    end

end
