class Partner:
    def __init__(self, type,
                 name, d_last_name,
                 d_first_name, d_sur_name, e_mail, phone, address, inn, rating, id, skidka=0):
        self.type = type
        self.name = name
        self.d_last_name = d_last_name
        self.d_first_name = d_first_name
        self.d_sur_name = d_sur_name
        self.e_mail = e_mail
        self.phone = phone
        self.address = address
        self.inn = inn
        self.rating = rating
        self.id = id
        self.skidka = skidka