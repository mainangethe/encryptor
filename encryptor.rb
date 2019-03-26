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

  def encrypt_file(filename, rotation)
    # 1. Create the file handle to the input file
    input = File.open(filename, 'r')
    # 2. Read the text of the input file
    file_contents = input.read
    # 3. Encrypt the text
    encrypted = encrypt(file_contents, rotation)
    # 4. Create a name for the output file
    output_file = 'enc_' + filename
    # 5. Create an output file handle
    output = File.open(output_file, 'w')
    # 6. Write out the text
    output.write encrypted
    # 7. Close the file
    output.close
    puts "File encrypted. Go open #{ output_file }"
  end

  def decrypt_file(filename, rotation)
    input = File.open(filename, 'r')
    file_contents = input.read
    decrypted = decrypt(file_contents, rotation)
    output_file = 'dec_' + filename
    output = File.open(output_file, 'w')
    output.write decrypted
    output.close
    puts "File decrypted. Go open #{ output_file}"
  end

end
