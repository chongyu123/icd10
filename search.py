
class ICD10(object):
    main_list = {}
    word_lookup = {}
    filtered_list = None
    
    def __init__(self):
        print "initializing data..."
        file = open('icd-codes.txt', 'r')
        for line in file:
            order_number = line[0:4]
            icd_10_code = line[6:13].strip().lower()
            is_header = line[14]
            short_desc = line[16:76]
            long_desc = line[77:]
            self.main_list[icd_10_code] = long_desc.strip()
            self.build_word_lookup(icd_10_code, long_desc)

        file.close()


    def build_word_lookup(self, code, description):
        
        for word in description.replace(",","").lower().split():
            if (self.word_lookup.has_key(word) != True):
                self.word_lookup[word] = []
                
            self.word_lookup[word].append(code)


    def get_description(self, code):
        try:
            result = self.main_list[code.lower()]
        except KeyError:
            print code
            result = "no match"
            
        return result

    
    def get_word(self, word):
        return self.word_lookup[word]


    def apply_filters(self, words):
        for word in words:
            if self.word_lookup.has_key(word.lower()):
                if self.filtered_list == None:
                    self.filtered_list = set(self.word_lookup[word.lower()])
                else:
                    self.filtered_list = (self.filtered_list & set(self.word_lookup[word.lower()]))
            else:
                self.filtered_list = []
            
               
        if (self.filtered_list != None):
            result = list(self.filtered_list)
        return result

    def get_suggested_words(self):
        if (self.filtered_list == None):
            return "no suggestions"
        
        for code in self.filtered_list:
            print self.main_list[self.filtered_list]

    def reset_filters(self):
        self.filtered_list = None


icd=ICD10()
while True:
    print "==================================="
    search_words = raw_input("Enter search words (leave blank to reset): ")
    if (search_words == ""):
        icd.reset_filters()
        print "Filters cleared"
        continue
    result = icd.apply_filters(search_words.replace(",","").lower().split())
    if (result != None):
        for code in result:
            print icd.get_description(code)
    else:
        print "no matches"
    print("%d results" % len(result))



