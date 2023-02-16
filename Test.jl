# include -
include("Include.jl")

# testing -
plaintext = "Julia is awesome. The computer is my best friend, and it loves me. This is a test and only a test."

d = encrypt(plaintext)
test = decrypt(d)