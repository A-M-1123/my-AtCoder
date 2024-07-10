def putsTF(bool,strT,strF)
    (bool)?(puts strT):(puts strF)
end
def putsYN(bool)
    putsTF(bool,"Yes","No")
end
# putsTF(bool, strT, strF) putsYN(bool)