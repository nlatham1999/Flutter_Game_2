data = " \
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa,\
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa,\
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaggggggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa,\
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaajaajaajaaaaaaaaaaaaaaaaaaaaajajaaaaaaaaaaaaaĞaaaajaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaiiiiiiaaaaaaaaaaaaaajaaaaajaaaaaajaaaajaaaaaaaaaaaaaaaaaaaaa,\
aaaggggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaagaaggggĞgggĞĞĞĞaaĞĞaaĞĞaaĞĞaaĞĞaĞĞĞĞaaaaaaaaaaaaaaaaggĞaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaagggaggĞĞĞĞĞaagggaagggaaĞĞĞĞaaaaaaaaaaaaĞĞ,\
aaaiaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaĞĞaaaaiaggĞaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaamabaaaaagaaaaaaaaaaaaaaaaaaaaaaaaaalaaaaaaaa,\
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaagaaaaagĞaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaagggaaaaaaaaaaaaaaaaaaaaaaaaaaaalaaaaaaalaaaa,\
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaajaaaaaajagajajaabaaaaaaaaaaaaaggaaaaĞaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaĞabaaaaaaaaaaaaaaaaaaamaaaamagajajaabaaamaaaaaaaaaaaaaaaaaajaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa,\
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaggggggggggggggggggggggggggaaaaaagggaaĞaaaĞĞĞĞaaĞĞaaĞĞaaĞĞaaĞĞaggggaaaaaaaaaaaaaaaaggĞaaaaaaaaaaaggggggggggggggggggggggggggaaaaaaaaaaaaaaĞĞĞĞĞĞggaaaaaaaaaĞĞĞĞĞaaaaaaaaaaaaĞĞĞĞaaaaaaaaaaaaĞĞ,\
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaajaaaaaaaaggggggggggggggggggggggggggggaaaaiiaaagaaagaaaaaaaaaaaaaaaaaaaaaiiiiaaaaaaaaaaaaaaaaaaaaaaaaaaaaaggggggggggggggggggggggggggggaaaaaaaaaaggaaaaaaagaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa,\
aaaaaaaaamaaaaaaaaaaaaaaaaaaaaaaaaaaaaaggggaaaaaaggaaiagggaiaaaaaaaaiaaaaaaagggaaaaaaaggaaggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaggaaaaaaaaaaaaaggaaiagggaiaaaaaiaaiiaaaaaagggaaaaaaggaggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa,\
aaaaggggggggaaaaaaaaaaaaaaaaaaaaaaaaagggaaggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaagggagggaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaamaaaaaaaaaaaaaamagaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaggaggaĞĞaĞaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa,\
aaaĞĞĞĞĞĞĞĞĞbaaaaaaaaaaaaaaaaaaaaaaĞaĞaaaaagĞĞĞĞĞaaaaaaaaaaaaaaaaaaaaaaaaaĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞaaĞĞaaĞĞaaĞĞaaĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞaaaaaaaaaaaaaaaaaaaaaaaaaĞĞĞĞĞĞĞaĞĞaĞĞaaaaaĞĞĞĞĞaaaaaaaaaaaĞĞĞĞĞaaaaaaaaaaaaĞĞĞĞaaaaaaaaaaaaĞĞ,\
aagaaaaaaaaagaaaaaaaaaaaaaaaaaaaaagaaaaaaaaaaaaaagaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaagaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa,\
aggaaaaaaaaagbaaaaabaabaabaabaaaaggaaaaaaaaaaaaaaggaaaaajaaaaaaaaaajaaaaagaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaggaaaaajaaaaaaaaaajgaaamgaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa,\
gggaaaaaaaaaggaggggggggggggggggggggaaaaaaaaaaaaaagggggggggggggggggggggggggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaagggggggggggggggggggggggggaaaaaaaaaaaaaaggagaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa,\
"

l = data.split(",")

arr = []


while(len(l[0]) > 5):
    arr2 = []
    for i in range(0, len(l)):
        arr2.append(l[i][:5])
        l[i] = l[i][5:]
    arr.append(arr2)

for x in arr:
    print(x)
