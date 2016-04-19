require 'openssl'
require 'digest/sha2'

module BrowseMail
  class Crypto
    KEY = 'zNymKdzgjoHy2WjboJEZJKFs5YhllwI9x9L4UAKGbvqAcRUCit'.freeze

    def self.encrypt(plain_text)
      new.encrypt(plain_text)
    end

    def self.decrypt(cipher_hex)
      new.decrypt(cipher_hex)
    end

    def initialize(algorithm = 'aes-256-ecb')
      @algorithm = algorithm
    end

    def encrypt(plain_text)
      crypto = start(:encrypt)
      cipher_text = crypto.update(plain_text) + crypto.final
      cipher_text.unpack('H*').join
    end

    def decrypt(cipher_hex)
      crypto = start(:decrypt)
      cipher_text = [cipher_hex].pack('H*')
      crypto.update(cipher_text) + crypto.final
    end

    private

    def start(mode)
      crypto = OpenSSL::Cipher::Cipher.new(@algorithm).send(mode)
      crypto.key = Digest::SHA256.hexdigest(KEY)
      crypto
    end
  end
end
