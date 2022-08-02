# LETTERS = ('a'..'z').to_a


# def decrypt_rot(string)
#   decrypted = ''

#   string.each_char do |char|
#     if LETTERS.include? char.downcase
#       char_idx = LETTERS.index(char.downcase)
#       new_char_idx = ( char_idx + 13 > 25 ? 12 - (25 - char_idx) : char_idx + 13)

#       new_char = LETTERS.include?(char) ? LETTERS[new_char_idx] : LETTERS[new_char_idx].upcase
#       decrypted << new_char
#     else
#       decrypted << char
#     end
#   end

#   decrypted
# end
def decrypt_rot(str)
  str.tr('a-zA-z', 'n-za-mN-ZA-M')
end


p decrypt_rot('Nqn Ybirynpr')
p decrypt_rot('Tenpr Ubccre')
p decrypt_rot('Nqryr Tbyqfgvar')
p decrypt_rot('Nyna Ghevat')
p decrypt_rot('Puneyrf Onoontr')
p decrypt_rot('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p decrypt_rot('Wbua Ngnanfbss')
p decrypt_rot('Ybvf Unvog')
p decrypt_rot('Pynhqr Funaaba')
p decrypt_rot('Fgrir Wbof')
p decrypt_rot('Ovyy Tngrf')
p decrypt_rot('Gvz Orearef-Yrr')
p decrypt_rot('Fgrir Jbmavnx')
p decrypt_rot('Xbaenq Mhfr')
p decrypt_rot('Fve Nagbal Ubner')
p decrypt_rot('Zneiva Zvafxl')
p decrypt_rot('Zneiva Zvafxl')
p decrypt_rot('Lhxvuveb Zngfhzbgb')
p decrypt_rot('Unllvz Fybavzfxv')
p decrypt_rot('Tregehqr Oynapu')

