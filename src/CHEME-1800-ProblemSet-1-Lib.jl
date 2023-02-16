"""
    encrypt(plaintext::String) -> Dict{Int64,String}

Fill me in
The function "encrypt" takes the plain text string, runs it, and returns an encrypted data structure.
""" 
function encrypt(plaintext::String)::Dict{Int64,String}
 # initialize -
 message = Dict{Int64,String}()
 counter = 0;

 # build encryptionkey -
 encryption_model = _build(DNAEncryptionKey);
 encryptionkey = encryption_model.encryptionkey;

 for c ∈ uppercase(plaintext)

     # encrypt -
     message[counter] = encryptionkey[c]

     # update the counter -
     counter = counter + 1
 end

 # return -
 return message
end


"""
    decrypt(encrypteddata::Dict{Int64,String}) -> String

Fill me in
The function "decrypt" takes the encrypted data structure, runs it, and returns the plain text string.
"""
function decrypt(encrypteddata::Dict{Int64,String})::String
 # initialize -
 number_of_chars = length(encrypteddata)
 inverse_encryptionkey_dict = Dict{String, Char}()
 plaintext = Vector{Char}()

 # build encryptionkey -
 encryption_model = _build(DNAEncryptionKey);
 encryptionkey = encryption_model.encryptionkey;

 # build the inverse_key -
 for (key, value) ∈ encryptionkey
     inverse_encryptionkey_dict[value] = key
 end

 for i ∈ 0:(number_of_chars - 1)
     
     codon = encrypteddata[i]
     value = inverse_encryptionkey_dict[codon]
     push!(plaintext, value)
 end

 # return -
 return String(plaintext)
end