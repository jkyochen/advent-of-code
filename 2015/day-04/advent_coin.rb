require 'digest'

class AdventCoin

    def self.mining(secret, zero_times = 5)
        nonce = 1
        (nonce..).each do |i|
            md5hex = Digest::MD5.hexdigest(secret + i.to_s)
            next if !md5hex.start_with?("0" * zero_times)
            return i
        end
    end
end
