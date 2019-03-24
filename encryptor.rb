class Encryptor
  def cipher rotation
    characters = (' '..'z').to_a
    Hash[ characters.zip(characters.rotate(rotation))]
  end

  def encrypt_letter letter, rotation
    rotated_cypher = cipher(rotation)
    rotated_cypher[letter]
  end

  def encrypt text, rotation
    letters = text.split('')

    results = letters.map { |letter| encrypt_letter(letter, rotation) }
    results.join('')
  end

  def decrypt text, rotation
    letters = text.split('')
    results = letters.map { |letter| encrypt_letter(letter, -rotation) }
    results.join('')
  end

end
